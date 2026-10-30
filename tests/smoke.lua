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
check('timeoutlen', vim.o.timeoutlen == 300)
check('clipboard', vim.o.clipboard == '')

-- 3. colorscheme
check('colorscheme', vim.g.colors_name == 'catppuccin-macchiato', vim.g.colors_name)

-- 4. plugins
local plugins = require('lazy.core.config').plugins
local count = vim.tbl_count(plugins)
check('plugin count', count >= 40, count)
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

-- 6. keymap
local function desc(mode, lhs)
  local m = vim.fn.maparg(lhs, mode, false, true)
  return m and m.desc or ''
end
check(']d next', desc('n', ']d') == 'Diagnostic next', desc('n', ']d'))
check('[d prev', desc('n', '[d') == 'Diagnostic prev', desc('n', '[d'))
check('jk escape', vim.fn.maparg('jk', 'i') ~= '')
check('jj escape', vim.fn.maparg('jj', 'i') ~= '')

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
