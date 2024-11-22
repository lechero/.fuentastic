local status, harpoon = pcall(require, "harpoon")
if (not status) then return end

-- harpoon:setup()
--
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

harpoon.setup {
  menu = {
    width = vim.api.nvim_win_get_width(0) - 48,
    height = vim.api.nvim_win_get_height(0) - 32,
  }
}

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
-- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "ga", mark.add_file)
vim.keymap.set("n", "ge", ui.toggle_quick_menu)
