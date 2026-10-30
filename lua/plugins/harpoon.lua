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

    vim.keymap.set('n', '<leader>e', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon menu' })

    -- Tutup menu pakai <C-c>, bukan cuma <Esc>
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'harpoon',
      callback = function(args)
        vim.keymap.set('n', '<C-c>', function()
          harpoon.ui:toggle_quick_menu()
        end, { buffer = args.buf, silent = true, desc = 'Tutup harpoon' })
      end,
    })

    for i = 1, 4 do
      vim.keymap.set('n', '<leader>' .. i, function()
        harpoon:list():select(i)
      end, { desc = 'Harpoon file ' .. i })
    end

    vim.keymap.set('n', '<leader>[', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon sebelumnya' })
    vim.keymap.set('n', '<leader>]', function()
      harpoon:list():next()
    end, { desc = 'Harpoon berikutnya' })
  end,
}
