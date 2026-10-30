-- treesitter branch main: highlighting/indent memakai fitur bawaan Neovim,
-- plugin ini hanya memasang parser + query.
local languages = {
  'bash',
  'c',
  'cpp',
  'css',
  'diff',
  'dockerfile',
  'gitignore',
  'go',
  'gomod',
  'html',
  'ini',
  'kotlin',
  'java',
  'javascript',
  'json',
  'latex',
  'lua',
  'luadoc',
  'make',
  'markdown',
  'markdown_inline',
  'php',
  'php_only',
  'phpdoc',
  'prisma',
  'proto',
  'python',
  'rust',
  'sql',
  'typescript',
  'tsx',
  'vim',
  'vimdoc',
  'xml',
  'yaml',
  'zig',
}

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install(languages)

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter-attach', { clear = true }),
      callback = function(event)
        local ok = pcall(vim.treesitter.start, event.buf)
        if not ok then
          return
        end
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    -- Incremental selection: sekarang pakai API bawaan Neovim
    vim.keymap.set({ 'n', 'x', 'o' }, '<C-space>', function()
      vim.treesitter.select 'parent'
    end, { desc = 'Treesitter select parent' })
    vim.keymap.set({ 'n', 'x', 'o' }, '<M-space>', function()
      vim.treesitter.select 'child'
    end, { desc = 'Treesitter select child' })
  end,
}
