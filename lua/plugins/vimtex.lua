return {
  'lervag/vimtex',
  lazy = false, -- we don't want to lazy load VimTeX
  init = function()
    vim.g.vimtex_view_method = 'zathura'
    -- tectonic: compiler single-binary, tidak butuh texlive penuh
    vim.g.vimtex_compiler_method = 'tectonic'
  end,
}
