local status, saga = pcall(require, "lspsaga")
if (not status) then return end
--
-- saga.setup({
--   ui = {
--     -- currently only round theme
--     theme = 'round',
--     -- border type can be single,double,rounded,solid,shadow.
--     border = 'single',
--     winblend = 0,
--     expand = '',
--     collapse = '',
--     preview = ' ',
--     code_action = '',
--     diagnostic = '🐞',
--     incoming = ' ',
--     outgoing = ' ',
--     colors = {
--       --float window normal bakcground color
--       normal_bg = '#3b4151',
--       --title background color
--       title_bg = '#81a1c1',
--       -- red = '#e95678',
--       -- magenta = '#b33076',
--       -- orange = '#FF8700',
--       -- yellow = '#f7bb3b',
--       -- green = '#afd700',
--       cyan = '#88c1d0',
--       -- blue = '#61afef',
--       -- purple = '#CBA6F7',
--       -- white = '#d1d4cf',
--       -- black = '#1c1c19',
--     },
--     kind = {},
--   },
-- })
-- -- saga.init_lsp_saga {
-- --   server_filetype_map = {
-- --     typescript = 'typescript'
-- --   },
-- --   code_action_icon = "",
-- -- }
--
--
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', ']g', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- vim.keymap.set('n', '[g', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
-- vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
-- vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- vim.keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
-- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
-- -- vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
-- vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- vim.keymap.set({ "n", "v" }, "<leader>su", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- vim.keymap.set("n", "su", "<cmd>Lspsaga code_action<CR>", { silent = true })