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
    local function apply_background()
      local ok, lines = pcall(vim.fn.readfile, vim.fn.expand '~/.config/theme')
      local flavour = ((ok and lines[1]) or 'macchiato'):gsub('%s+$', '')
      vim.o.background = flavour == 'latte' and 'light' or 'dark'
      vim.cmd.colorscheme 'catppuccin'
    end

    apply_background()
    vim.api.nvim_create_autocmd('FocusGained', { callback = apply_background })
  end,
}
