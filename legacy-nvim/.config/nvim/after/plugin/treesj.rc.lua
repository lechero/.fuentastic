local status, treesj = pcall(require, "treesj")
if (not status) then return end

treesj.setup({
  use_default_keymaps = false,
})

local format = require("treesj.format")

vim.keymap.set("n", "<leader>m", format._format, { silent = true })
