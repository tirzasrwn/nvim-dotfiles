-- Smoke test. Jalankan: nvim --headless -l tests/smoke.lua
local fails = {}
local function check(name, ok, detail)
  if not ok then
    fails[#fails + 1] = name .. (detail and (': ' .. tostring(detail)) or '')
  end
end

-- 1. init.lua termuat
local cfg = vim.fn.stdpath 'config'
check('MYVIMRC', vim.env.MYVIMRC == cfg .. '/init.lua', vim.env.MYVIMRC)

-- 2. options
check('leader', vim.g.mapleader == ' ')
check('number', vim.o.number and vim.o.relativenumber)
check('indent', vim.o.expandtab and vim.o.tabstop == 4 and vim.o.shiftwidth == 4)
check('scrolloff', vim.o.scrolloff == 10)
check('timeoutlen', vim.o.timeoutlen == 2000, vim.o.timeoutlen)
check('clipboard', vim.o.clipboard == '')

-- 3. colorscheme
check('colorscheme', vim.g.colors_name == 'catppuccin-macchiato', vim.g.colors_name)

-- 4. plugins
local plugins = require('lazy.core.config').plugins
local count = vim.tbl_count(plugins)
check('plugin count', count >= 35, count)
for name, spec in pairs(plugins) do
  if spec.dir and not vim.uv.fs_stat(spec.dir) then
    check('plugin installed', false, name)
  end
end

-- 5. hanya LSP asli yang masuk lspconfig (0.12: config ada di vim.lsp.config)
for _, name in ipairs { 'gopls', 'lua_ls', 'ts_ls', 'clangd', 'bashls' } do
  check('lspconfig ' .. name, vim.lsp.config[name] ~= nil)
end
for _, name in ipairs { 'prettier', 'shfmt', 'goimports', 'gofumpt' } do
  check('not an lsp ' .. name, vim.lsp.config[name] == nil)
end
check('gopls enabled', vim.lsp.is_enabled 'gopls')
check('stylua not enabled', not vim.lsp.is_enabled 'stylua')

-- 5b. completion, terminal, treesitter
check('blink', pcall(require, 'blink.cmp'))
check('blink capabilities', next(require('blink.cmp').get_lsp_capabilities()) ~= nil)
check('snacks', pcall(require, 'snacks'))
check('treesitter', pcall(require, 'nvim-treesitter'))

local parsers = vim.fn.globpath(vim.fn.stdpath 'data' .. '/site/parser', '*.so', false, true)
check('parsers installed', #parsers >= 30, #parsers)

local tmp = vim.fn.tempname() .. '.lua'
vim.fn.writefile({ 'local x = 1', 'return x' }, tmp)
vim.cmd.edit(tmp)
vim.wait(500)
check('treesitter active', vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil)
check('indentexpr', vim.bo.indentexpr ~= '')
vim.cmd.bwipeout { bang = true }

-- 6. keymap
local function desc(mode, lhs)
  local m = vim.fn.maparg(lhs, mode, false, true)
  return m and m.desc or ''
end
check(']d next', desc('n', ']d') == 'Diagnostic next', desc('n', ']d'))
check('[d prev', desc('n', '[d') == 'Diagnostic prev', desc('n', '[d'))
check('jk escape', vim.fn.maparg('jk', 'i') ~= '')
check('jj escape', vim.fn.maparg('jj', 'i') ~= '')
check('textobject move', vim.fn.maparg(']m', 'n') ~= '')
check('textobject select', vim.fn.maparg('if', 'x') ~= '')
check('terminal toggle', desc('n', '<C-a>') ~= '')
check('window nav', desc('n', '<C-h>') == 'Window kiri')
check('harpoon slot', desc('n', '<leader>1') ~= '')
check('gitsigns hunk', desc('n', ']c') ~= '')
check('grug-far', desc('n', '<leader>rr') ~= '')
check('lazygit', desc('n', '<leader>gg') == 'LazyGit')
check('session save', desc('n', '<leader>qs') ~= '')
check('bufferline', pcall(require, 'bufferline'))
check('mini.pairs', pcall(require, 'mini.pairs'))
check('mini.ai', pcall(require, 'mini.ai'))
check('spell toggle', desc('n', '<leader>tz') ~= '')
check('nvimtree toggle', desc('n', '<C-\\>') == 'Toggle NvimTree', desc('n', '<C-\\>'))

-- tool eksternal
check('tectonic', vim.fn.executable 'tectonic' == 1)
check('lazygit bin', vim.fn.executable 'lazygit' == 1)
check('vimtex compiler', vim.g.vimtex_compiler_method == 'tectonic', vim.g.vimtex_compiler_method)

-- 7. semua file lua bisa di-parse
local files = vim.fn.globpath(cfg, '{lua,tests}/**/*.lua', false, true)
for _, f in ipairs(files) do
  local fn, err = loadfile(f)
  check('parse ' .. f, fn ~= nil, err)
end
check('files found', #files > 0, #files)

if #fails == 0 then
  print(('SMOKE OK (%d plugins, %d files)'):format(count, #files))
  vim.cmd 'qa'
else
  io.stderr:write('SMOKE FAIL\n  ' .. table.concat(fails, '\n  ') .. '\n')
  vim.cmd 'cq'
end
