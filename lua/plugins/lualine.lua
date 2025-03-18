return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
        disabled_filetypes = {
          'netrw',
          'NvimTree',
          'diff',
          'undotree',
        },
      }
    })
  end,
}
