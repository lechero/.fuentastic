local status, yanky = pcall(require, "yanky")
if (not status) then return end

yanky.setup({})

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

local telescopeStatus, telescope = pcall(require, "telescope")
if (not telescopeStatus) then return end

telescope.load_extension("yank_history")

vim.keymap.set('n', '\\p', function()
  telescope.extensions.live_grep_args.live_grep_args()
end)
