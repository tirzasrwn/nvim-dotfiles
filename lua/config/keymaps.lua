-- Keymap global + autocmd. Dipanggil dari init.lua sebelum plugin dimuat
-- (buffer-local keymap LSP dipasang di plugin/nvim-lspconfig.lua).

local map = vim.keymap.set

-- Escape dari insert tanpa keluar dari jari
map('i', 'jk', '<Esc>')
map('i', 'jj', '<Esc>')

-- Bersihkan highlight pencarian
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Keluar dari terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Navigasi window (Alt, karena <C-h/j/k/l> dipakai harpoon)
map('n', '<A-h>', '<C-w>h', { desc = 'Window kiri' })
map('n', '<A-j>', '<C-w>j', { desc = 'Window bawah' })
map('n', '<A-k>', '<C-w>k', { desc = 'Window atas' })
map('n', '<A-l>', '<C-w>l', { desc = 'Window kanan' })

-- Ejaan
map('n', '<leader>tz', '<cmd>setlocal spell!<CR>', { desc = 'Toggle spell' })

-- Panah dimatikan sebagai pengingat pakai hjkl
map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Jaga posisi kursor di tengah saat melompat
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')
map('n', '{', '{zz')
map('n', '}', '}zz')
map('n', ']]', ']]zz')
map('n', 'G', 'Gzz')

-- Pindahkan baris/selection
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Paste tanpa menimpa register, dan clipboard lewat leader
map({ 'x', 'v' }, '<leader>P', [["_dP]], { desc = 'Paste tanpa overwrite register' })
map('n', '<leader>p', [["+p]], { desc = 'Paste dari clipboard sistem' })
map({ 'n', 'v', 'x' }, '<leader>y', [["+y]], { desc = 'Yank ke clipboard sistem' })
map('n', '<leader>Y', [["+Y]], { desc = 'Yank line ke clipboard sistem' })
map({ 'n', 'v', 'x' }, '<leader>d', [["_d]], { desc = 'Delete ke blackhole register' })

-- Diagnostic
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>lo', vim.diagnostic.open_float, { desc = 'Diagnostic open float' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Diagnostic next' })
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Diagnostic prev' })

-- Tmux sessionizer
map('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>', { desc = 'Tmux sessionizer' })

-- Highlight saat yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight saat yank',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
