return {
  'catppuccin/nvim',
  lazy = false,
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'auto', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'macchiato',
      },
      transparent_background = false,
      integrations = {
        cmp = true,
        fidget = true,
        gitsigns = true,
        harpoon = true,
        indent_blankline = {
          enabled = true,
          scope_color = 'lavender', -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        markdown = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
          },
          inlay_hints = {
            background = true,
          },
        },
        nvimtree = true,
        telescope = {
          enabled = true,
          style = 'classic',
        },
        treesitter_context = true,
        which_key = true,
      },
    }
    vim.cmd.colorscheme 'catppuccin-macchiato'
  end,
}
