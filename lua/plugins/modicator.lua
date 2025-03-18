return {
  'mawkler/modicator.nvim',
  lazy = false,
  dependencies = {
    'catppuccin/nvim',
    name = 'catppuccin',
  }, -- Add your colorscheme plugin here
  init = function()
    -- These are required for Modicator to work
    vim.o.cursorline = true
    vim.o.number = true
    vim.o.termguicolors = true
  end,
  config = function()
    require('modicator').setup({
      -- Show warning if any required option is missing
      show_warnings = true,
      highlights = {
        -- Default options for bold/italic
        defaults = {
          bold = true,
          italic = false,
        },
      },
      integration = {
        lualine = {
          enabled = true,
          -- Letter of lualine section to use (if `nil`, gets detected automatically)
          mode_section = nil,
          -- Whether to use lualine's mode highlight's foreground or background
          highlight = 'bg',
        },
      },
    })
  end
}
