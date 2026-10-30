return {
  'saghen/blink.cmp',
  version = '1.*',
  lazy = false,
  init = function()
    vim.lsp.config('*', {
      capabilities = require('blink.cmp').get_lsp_capabilities(),
    })
  end,
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
  },
  opts = {
    keymap = {
      preset = 'default',
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      documentation = { auto_show = false },
      menu = { border = 'rounded' },
    },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
  },
  config = function(_, opts)
    require('blink.cmp').setup(opts)
    -- Snippet tambahan untuk php: pakai juga snippet html
    require('luasnip').filetype_extend('php', { 'html' })
  end,
}
