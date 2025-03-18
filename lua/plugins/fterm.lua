return {
  'numToStr/FTerm.nvim',
  lazy = false,
  opts = {
    cmd = '/usr/bin/zsh',
  },
  config = function()
    require('FTerm').setup {
      cmd = '/usr/bin/zsh',
      border = 'rounded',
      dimensions = {
        height = 0.9, -- Height of the terminal window
        width = 0.9, -- Width of the terminal window
        x = 0.45, -- X axis of the terminal window
        y = 0.4, -- Y axis of the terminal window
      },
    }
    vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end,
}
