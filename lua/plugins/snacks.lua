-- Terminal float. Menggantikan FTerm.nvim yang sudah tidak dirawat.
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    terminal = { enabled = true },
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
  },
}
