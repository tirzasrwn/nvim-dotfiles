-- Cari & ganti se-project dengan preview.
return {
  'MagicDuck/grug-far.nvim',
  cmd = 'GrugFar',
  keys = {
    { '<leader>rr', '<cmd>GrugFar<CR>', desc = 'Replace se-project' },
    {
      '<leader>rb',
      function()
        require('grug-far').open { prefills = { paths = vim.fn.expand '%' } }
      end,
      desc = 'Replace di buffer ini',
    },
  },
  opts = {},
}
