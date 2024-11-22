local status, oil = pcall(require, "oil")
if (not status) then return end

oil.setup({
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
  }
})

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
