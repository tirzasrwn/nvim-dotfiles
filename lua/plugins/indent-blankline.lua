return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  opts = {
    -- `list=true` membuat ibl memakai listchars `tab:» ` sebagai guide,
    -- jadi paksa karakter guide sendiri.
    indent = { char = '│', tab_char = '│' },
    scope = { char = '┃' },
  },
}
