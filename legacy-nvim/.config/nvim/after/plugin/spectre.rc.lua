local status, spectre = pcall(require, "spectre")
if (not status) then return end

spectre.setup({
  mapping = {
    ['resume_last_search'] = {
      map = "<leader>rr",
      cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
      desc = "resume last search before close"
    },
  }
})
local keymap = vim.keymap

keymap.set("n", ";ss", function() spectre.open() end, { silent = true })
keymap.set("n", ";sw", function() spectre.open_visual({ select_word = true }) end, { silent = true })
keymap.set("n", "ss", function() spectre.open() end, { silent = true })
keymap.set("n", "sw", function() spectre.open_visual({ select_word = true }) end, { silent = true })
keymap.set("n", ";sf", function() spectre.open_file_search() end, { silent = true })
