-- Options, leader, dan flag global. Dimuat sebelum lazy.nvim.

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set true kalau sudah pakai Nerd Font di terminal
vim.g.have_nerd_font = true

-- Netrw dimatikan, file explorer pakai nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 10
opt.signcolumn = 'yes'
opt.showmode = false
opt.wrap = false
opt.guicursor = ''

opt.breakindent = true
opt.undofile = true
opt.inccommand = 'split'

opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 250
opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Jangan otomatis pakai clipboard sistem; dipakai lewat <leader>y/<leader>p
opt.clipboard = ''
