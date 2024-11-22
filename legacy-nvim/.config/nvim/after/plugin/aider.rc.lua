local status, aider = pcall(require, "aider")
if (not status) then return end

-- set a keybinding for the OpenAider function
vim.api.nvim_set_keymap('n', ';o', '<cmd>lua require("aider").OpenAider()<cr>', { noremap = true, silent = true })
