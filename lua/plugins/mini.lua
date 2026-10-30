-- mini.nvim: auto-pairs, surround, dan text object tambahan.
return {
  'nvim-mini/mini.nvim',
  event = 'VeryLazy',
  config = function()
    require('mini.pairs').setup()
    require('mini.surround').setup()
    require('mini.ai').setup()
  end,
}
