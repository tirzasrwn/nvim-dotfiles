return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    vim.keymap.set("n", "<leader>lc", function()
      require("jdtls").compile("full")
    end, { desc = "jdtls.compile" })
  end,
}
