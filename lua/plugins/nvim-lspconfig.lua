-- LSP. Neovim 0.12: konfigurasi per-server lewat vim.lsp.config, aktivasi
-- lewat vim.lsp.enable. mason hanya mengurus instalasi.
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    {
      'mason-org/mason-lspconfig.nvim',
      opts = {
        -- stylua punya mode LSP, tapi kita pakai conform untuk formatting
        automatic_enable = { exclude = { 'stylua' } },
      },
    },
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    -- Server yang dipakai. Key = nama server, value = override opsional.
    local servers = {
      bashls = {},

      clangd = {},

      cssls = {},
      html = {},

      docker_compose_language_service = {},

      gopls = {
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
            gofumpt = true,
          },
        },
      },

      intelephense = {},
      jdtls = {},
      lemminx = {},

      lua_ls = {
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },

      marksman = {},
      prismals = {},
      rust_analyzer = {},
      taplo = {},
      texlab = {},
      ts_ls = {},
      zls = {},
    }

    -- Tool mason yang bukan LSP (formatter/linter)
    local tools = { 'gofumpt', 'goimports', 'prettier', 'shfmt', 'stylua' }

    vim.lsp.config('*', {
      capabilities = require('blink.cmp').get_lsp_capabilities(),
    })

    for name, opts in pairs(servers) do
      vim.lsp.config(name, opts)
    end
    vim.lsp.enable(vim.tbl_keys(servers))

    local install = vim.tbl_keys(servers)
    vim.list_extend(install, tools)
    require('mason-tool-installer').setup { ensure_installed = install }

    -- Keymap dan highlight saat LSP menempel ke buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          vim.keymap.set(mode or 'n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        local builtin = require 'telescope.builtin'

        map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
        map('gr', builtin.lsp_references, '[G]oto [R]eferences')
        map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
          return
        end

        -- Highlight referensi saat kursor diam
        if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local group = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = group,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = group,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(args)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = args.buf }
            end,
          })
        end

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }, { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = { source = 'if_many', spacing = 2 },
    }
  end,
}
