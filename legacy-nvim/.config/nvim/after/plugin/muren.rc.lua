local status, muren = pcall(require, "muren")
if (not status) then return end

muren.setup({
  -- ui sizes
  patterns_width = 50,
  patterns_height = 20,
  options_width = 20,
  preview_height = 18,
})

vim.keymap.set("n", "sm", ":MurenToggle<CR>", { silent = true })
