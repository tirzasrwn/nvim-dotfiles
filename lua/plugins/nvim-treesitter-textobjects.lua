-- Text object berbasis treesitter (select + move).
-- Branch main: mapping ditulis manual, tidak lewat configs.setup.
return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  lazy = false,
  config = function()
    require('nvim-treesitter-textobjects').setup {
      select = { lookahead = true },
      move = { set_jumps = true },
    }

    local select = function(query)
      return function()
        require('nvim-treesitter-textobjects.select').select_textobject(query, 'textobjects')
      end
    end

    local move = function(dir, query)
      return function()
        require('nvim-treesitter-textobjects.move')['goto_' .. dir](query, 'textobjects')
      end
    end

    local opts = { remap = true }

    vim.keymap.set({ 'x', 'o' }, 'aa', select '@parameter.outer', opts)
    vim.keymap.set({ 'x', 'o' }, 'ia', select '@parameter.inner', opts)
    vim.keymap.set({ 'x', 'o' }, 'af', select '@function.outer', opts)
    vim.keymap.set({ 'x', 'o' }, 'if', select '@function.inner', opts)
    vim.keymap.set({ 'x', 'o' }, 'ac', select '@class.outer', opts)
    vim.keymap.set({ 'x', 'o' }, 'ic', select '@class.inner', opts)

    vim.keymap.set({ 'n', 'x', 'o' }, ']m', move('next_start', '@function.outer'), opts)
    vim.keymap.set({ 'n', 'x', 'o' }, ']M', move('next_end', '@function.outer'), opts)
    vim.keymap.set({ 'n', 'x', 'o' }, '[m', move('previous_start', '@function.outer'), opts)
    vim.keymap.set({ 'n', 'x', 'o' }, '[M', move('previous_end', '@function.outer'), opts)
    vim.keymap.set({ 'n', 'x', 'o' }, ']]', move('next_start', '@class.outer'), opts)
    vim.keymap.set({ 'n', 'x', 'o' }, '][', move('next_end', '@class.outer'), opts)
    vim.keymap.set({ 'n', 'x', 'o' }, '[[', move('previous_start', '@class.outer'), opts)
    vim.keymap.set({ 'n', 'x', 'o' }, '[]', move('previous_end', '@class.outer'), opts)
  end,
}
