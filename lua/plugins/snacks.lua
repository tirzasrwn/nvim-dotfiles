return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    terminal = { enabled = true, win = { position = 'float' } },
    lazygit = { enabled = true },
    bufdelete = { enabled = true },
    notifier = { enabled = true, timeout = 2500 },
    words = { enabled = true },
    input = { enabled = true },
    session = { enabled = true },
  },
  keys = {
    {
      '<C-a>',
      function()
        require('snacks').terminal.toggle()
      end,
      mode = { 'n', 't' },
      desc = 'Toggle terminal float',
    },
    {
      '<leader>gg',
      function()
        require('snacks').lazygit()
      end,
      desc = 'LazyGit',
    },
    {
      '<leader>bd',
      function()
        require('snacks').bufdelete()
      end,
      desc = 'Hapus buffer',
    },
    {
      '<leader>qs',
      function()
        require('snacks').session.save()
      end,
      desc = 'Simpan session',
    },
    {
      '<leader>qr',
      function()
        require('snacks').session.load()
      end,
      desc = 'Restore session',
    },
  },
}
