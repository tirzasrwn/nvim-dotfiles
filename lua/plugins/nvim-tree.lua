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
      },
    }
  end,
}
