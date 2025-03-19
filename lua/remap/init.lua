-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- keep center
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', ']]', ']]zz')
vim.keymap.set('n', 'G', 'Gzz')

-- move selected up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- delete into blackhole buffer and paste
vim.keymap.set({ 'x', 'v' }, '<leader>P', [["_dP]])

-- paste from system clipboard
vim.keymap.set('n', '<leader>p', [["+p]])

-- yank into system clipboard
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- delete into blackhole
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', [["_d]])

-- open tmux-sessionizer
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- next and previous search result, compiler errors, or other commands that generate a list of locations
-- vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
-- vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- lsp
vim.keymap.set('n', '<leader>lw', vim.lsp.buf.workspace_symbol, { desc = 'workspace_symbol' })
vim.keymap.set('n', '<leader>lo', vim.diagnostic.open_float, { desc = 'diagnostic.open_float' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_next, { desc = 'diagnostic.goto_next' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, { desc = 'diagnostic.goto_prev' })
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, { desc = 'references' })
-- vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'format' })
vim.keymap.set('i', '<leader>lh', vim.lsp.buf.signature_help, { desc = 'signature_help' })
