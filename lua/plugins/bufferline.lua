-- Tab buffer di atas.
return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      separator_style = 'slant',
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      always_show_bufferline = true,
      offsets = {
        { filetype = 'NvimTree', text = 'File Explorer', highlight = 'Directory', text_align = 'left' },
      },
    },
  },
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Buffer sebelumnya' },
    { '<S-l>', '<cmd>BufferLineCycleNext<CR>', desc = 'Buffer berikutnya' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', desc = 'Tutup buffer lain' },
  },
}
