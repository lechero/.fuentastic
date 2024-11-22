local status, swapSplit = pcall(require, "swap-split")
if (not status) then return end

swapSplit.setup({
  ignore_filetypes = {
    "NvimTree"
  }
})

local map = vim.api.nvim_set_keymap
map('n', 'gv', '<cmd>lua require("swap-split").swap()<CR>', { noremap = true, silent = true })
map('n', 'si', '<cmd>lua require("swap-split").swap()<CR>', { noremap = true, silent = true })

vim.cmd [[
  hi SwapSplitStatusLine guifg=#ededed guibg=#4593c8
]]
