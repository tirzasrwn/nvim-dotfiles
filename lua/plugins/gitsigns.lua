return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
  config = function(_, opts)
    local gs = require 'gitsigns'
    gs.setup(opts)

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { desc = 'Git: ' .. desc })
    end

    map('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(gs.next_hunk)
      return '<Ignore>'
    end, 'Hunk berikutnya')

    map('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(gs.prev_hunk)
      return '<Ignore>'
    end, 'Hunk sebelumnya')

    map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
    map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')
    map('v', '<leader>hs', function()
      gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, 'Stage hunk (visual)')
    map('v', '<leader>hr', function()
      gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
    end, 'Reset hunk (visual)')
    map('n', '<leader>hS', gs.stage_buffer, 'Stage buffer')
    map('n', '<leader>hR', gs.reset_buffer, 'Reset buffer')
    map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')
    map('n', '<leader>hb', function()
      gs.blame_line { full = true }
    end, 'Blame line')
    map('n', '<leader>hd', gs.diffthis, 'Diff buffer')
    map('n', '<leader>hD', function()
      gs.diffthis '~'
    end, 'Diff buffer vs HEAD~')
    map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo stage hunk')

    vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Git: toggle blame line' })
  end,
}
