return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      renderer = {
        root_folder_label = false,
      },
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
      view = {
        side = 'right',
        width = 70,
      },
    }
    vim.keymap.set('n', '<leader><leader>', '<cmd>NvimTreeToggle<CR>')
  end,
}
