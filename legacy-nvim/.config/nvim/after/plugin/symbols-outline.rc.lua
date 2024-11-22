local status, symbolsOutline = pcall(require, "symbols-outline")
if (not status) then return end

symbolsOutline.setup()

vim.keymap.set('n', '<leader>e', ':SymbolsOutline<CR>', { noremap = true, silent = true })
