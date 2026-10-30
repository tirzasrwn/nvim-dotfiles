return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon tambah file' })

    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon menu' })

    -- Slot file, seperti config lama
    vim.keymap.set('n', '<C-h>', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon file 1' })
    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon file 2' })
    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon file 3' })
    vim.keymap.set('n', '<C-l>', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon file 4' })

    vim.keymap.set('n', '<C-p>', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon sebelumnya' })
    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():next()
    end, { desc = 'Harpoon berikutnya' })

    -- Tutup menu pakai <C-c>, bukan cuma <Esc>
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'harpoon',
      callback = function(args)
        vim.keymap.set('n', '<C-c>', function()
          harpoon.ui:toggle_quick_menu()
        end, { buffer = args.buf, silent = true, desc = 'Tutup harpoon' })
      end,
    })
  end,
}
