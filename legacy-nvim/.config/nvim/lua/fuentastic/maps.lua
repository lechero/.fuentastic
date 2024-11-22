local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "su", "<C-w><C-w>", { remap = false, silent = true })
keymap.set("n", "sp", "<C-w>p", { remap = false, silent = true })
keymap.set("n", "sw", "<C-w>p", { remap = false, silent = true })
keymap.set("n", "§", "<C-w><C-w>", { remap = false, silent = true })
-- keymap.set("n", "sp", ":! readlink -f % | pbcopy<CR><CR>", { silent = true })
-- -- Epic split move map using <tab> to move between windows or N<tab> to move
-- keymap.set("n", "<tab>", "<C-w><C-w>", { remap = false, silent = true })
-- keymap.set("n", "^", "<C-w>p", { remap = false, silent = true })
-- keymap.set("n", "<s-tab>", "gt", { remap = false, silent = true })
-- -- nnoremap <lt> <C-W><lt>
-- -- nnoremap > <C-W>>
-- -- nnoremap - <C-W>-
-- -- nnoremap + <C-W>+
-- keymap.set("n", "=<tab>", "<C-w>=", { remap = false, silent = true })
-- keymap.set("n", "_<tab>", "<C-w>_", { remap = false, silent = true })
-- keymap.set("n", "|<tab>", "<C-w>|", { remap = false, silent = true })
-- keymap.set("n", "+<tab>", "<C-w>|<C-w>_", { remap = false, silent = true })
-- -- keymap.set("n", "+", "<C-w>+", { remap = false, silent = true })
-- -- keymap.set("n", "-", "<C-w>-", { remap = false, silent = true })
-- keymap.set("n", "><tab>", "<C-w>>", { remap = false, silent = true })
-- keymap.set("n", "<lt><tab>", "<C-w><lt>", { remap = false, silent = true })
-- keymap.set("n", "=", "<C-w>=", { remap = false, silent = true })
-- keymap.set("n", "=<tab>", "<C-w>=", { remap = false, silent = true })
-- keymap.set("n", "-<tab>", "<C-w>_", { remap = false, silent = true })
-- keymap.set("n", "-<s-tab>", "<C-w>-", { remap = false, silent = true })
-- keymap.set("n", "<C-h>", "<C-w>>", { remap = false, silent = true })
-- keymap.set("n", "<C-l>", "<C-w><lt>", { remap = false, silent = true })
-- keymap.set("n", "<C-j>", "<C-w>2-", { remap = false, silent = true })
-- keymap.set("n", "<C-k>", "<C-w>2+", { remap = false, silent = true })
-- keymap.set("n", "+", "<C-w>10+", { remap = false, silent = true })
-- keymap.set("n", "-", "<C-w>10-", { remap = false, silent = true })

-- Move lines up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center screen on cursor while scrolling and searching
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Paste over selected text and don't update register
keymap.set("x", "<leader>p", [["_dP]])

-- copy to end of line
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- substitute word under cursor

keymap.set("n", "<C-s>", ":Obsession<CR>", { silent = true })
keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
keymap.set("n", "sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = true })

keymap.set("v", "<C-r>", "\"hy:%s/<C-r>h//gc<left><left><left>")

keymap.set("n", "sl", "\"ayiwoconsole.log('<C-R>a:', <C-R>a);<Esc>", { silent = true })
keymap.set("n", "sc", ":! readlink -f % | pbcopy<CR><CR>", { silent = true })

-- keymap.set("n", "<leader>i",
--   "<cmd>e /Users/miguelfuentes/Library/Mobile Documents/iCloud~md~obsidian/Documents/Fuentastic/notes/notes.md<CR>",
--   { silent = true })

keymap.set("n", "<leader>i",
  "<cmd>e ~/notes/notes.md<CR>",
  { silent = true })

keymap.set("n", "s]", ":bn<CR>", { silent = true })
keymap.set("n", "s[", ":bp<CR>", { silent = true })
keymap.set("n", "\\t", ":tab split<CR>", { silent = true })
keymap.set("n", "\\c", ":tabclose<CR>", { silent = true })
keymap.set("n", "\\q", ":q<CR>", { silent = true })
keymap.set("n", "\\w", ":w<CR>", { silent = true })
keymap.set("n", "<leader>w", ":w<CR>", { silent = true })
keymap.set("n", "\\x", ":Bclose<CR>", { silent = true })
keymap.set("n", ";c", ":ChatGPT<CR>", { silent = true })
keymap.set("n", ";cc", ":ChatGPT<CR>", { silent = true })
keymap.set("n", ";cr", ":ChatGPTEditWithInstructions<CR>", { silent = true })
keymap.set("n", ";ca", ":ChatGPTActAs<CR>", { silent = true })

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("n", ";n", "<Cmd>FloatermNew --width=0.8 --height=0.8 --title=News newsboat<CR>",
  { remap = false, silent = true })
keymap.set("n", "\\d", "<Cmd>FloatermNew --width=0.8 --height=0.8 --opener=edit --title=Docker lazydocker<CR>",
  { remap = false, silent = true })
keymap.set("n", "\\g", "<Cmd>FloatermNew --width=0.8 --height=0.8 --opener=edit --title=Git lazygit<CR>",
  { remap = false, silent = true })
keymap.set("n", "\\o", "<Cmd>FloatermNew --width=0.8 --height=0.8 --title=Ranger ranger<CR>",
  { remap = false, silent = true })
keymap.set("n", "<leader>gt", "<Cmd>FloatermNew --width=0.8 --height=0.8 --title=Tig tig<CR>",
  { remap = false, silent = true })
keymap.set("n", "<leader>g", "<Cmd>FloatermNew --width=0.8 --height=0.8 --title=Git lazygit<CR>",
  { remap = false, silent = true })
keymap.set("n", "<leader>o", "<Cmd>FloatermNew --width=0.8 --height=0.8 --opener=edit --title=Ranger ranger<CR>",
  { remap = false, silent = true })
keymap.set("n", "<leader>br", "<Cmd>FloatermNew --width=0.8 --height=0.8 --title=Broot br<CR>",
  { remap = false, silent = true })
-- keymap.set("n", "<leader>t", "<Cmd>FloatermNew --width=0.8 --height=0.8 --title=MTR sudo mtr<CR>",
--   { remap = false, silent = true })
keymap.set("n", "<leader>t", "<Cmd>FloatermNew --width=0.8 --height=0.8 --title=ScratchTerminal <CR>",
  { remap = false, silent = true })

-- keymap.set("n", "scg", "<Cmd>FloatermNew --width=0.8 --height=0.8 --title=Git lazygit<CR>",
--   { remap = false, silent = true })
-- keymap.set("n", "sco", "<Cmd>FloatermNew --width=0.8 --height=0.8 --title=Ranger ranger<CR>",
--   { remap = false, silent = true })
-- keymap.set("n", "scl", "<Cmd>FloatermNew --width=0.8 --height=0.8 --title=Ranger ranger ~/logs<CR>",
--   { remap = false, silent = true })
-- keymap.set("n", "scd", "<Cmd>FloatermNew --width=0.8 --height=0.8 --title=Ranger ranger ~/Document<CR>",
--   { remap = false, silent = true })

keymap.set("n", "<leader>zf", "<Cmd>ObsidianQuickSwitch<CR>", { silent = true })
keymap.set("n", "<leader>zw", "<Cmd>ObsidianSearch<CR>", { silent = true })
keymap.set("n", "<leader>zn", "<Cmd>ObsidianNew<CR>", { silent = true })

-- keymap.set("n", "<leader>zf", require('telekasten').find_notes)
-- keymap.set("n", "<leader>zn", require('telekasten').new_note)
-- keymap.set("n", "<leader>zt", require('telekasten').goto_today)
-- keymap.set("n", "<leader>zd", require('telekasten').find_daily_notes)
-- keymap.set("n", "<leader>zg", require('telekasten').search_notes)
-- keymap.set("n", "<leader>zz", require('telekasten').follow_link)

keymap.set("n", "<leader>1", "1gt", { silent = true })
keymap.set("n", "<leader>2", "2gt", { silent = true })
keymap.set("n", "<leader>3", "3gt", { silent = true })
keymap.set("n", "<leader>4", "4gt", { silent = true })
keymap.set("n", "<leader>5", "5gt", { silent = true })
keymap.set("n", "<leader>6", "6gt", { silent = true })
keymap.set("n", "<leader>7", "7gt", { silent = true })
keymap.set("n", "<leader>8", "8gt", { silent = true })
keymap.set("n", "<leader>9", "9gt", { silent = true })

-- " on hesitation, bring up the panel
-- keymap.set("n", "<leader>z", require('telekasten').panel)

vim.cmd [[
  nmap <leader>x :exec '!'.getline('.')
]]

keymap.set("v", "<leader>f", ':<C-u>lua require("fuentastic.css_to_tailwind").css_to_tailwind()<CR>')
-- require("fuentastic.css_to_tailwind").css_to_tailwind)


-- function execute_line()
--   local line = vim.fn.getline(".")
--   vim.cmd(line)
-- end
--local keymap = vim.keymap

--keymap.set('n', 'x', '"_x')

---- Increment/decrement
--keymap.set('n', '+', '<C-a>')
--keymap.set('n', '-', '<C-x>')

---- Delete a word backwards
--keymap.set('n', 'dw', 'vb"_d')

---- Select all
--keymap.set('n', '<C-a>', 'gg<S-v>G')

---- Save with root permission (not working for now)
----vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

---- New tab
--keymap.set('n', 'te', ':tabedit')
---- Split window
--keymap.set('n', 'ss', ':split<Return><C-w>w')
--keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
---- Move window
--keymap.set('n', '<Space>', '<C-w>w')
--keymap.set('', 'sh', '<C-w>h')
--keymap.set('', 'sk', '<C-w>k')
--keymap.set('', 'sj', '<C-w>j')
--keymap.set('', 'sl', '<C-w>l')

---- Resize window
--keymap.set('n', '<C-w><left>', '<C-w><')
--keymap.set('n', '<C-w><right>', '<C-w>>')
--keymap.set('n', '<C-w><up>', '<C-w>+')
--keymap.set('n', '<C-w><down>', '<C-w>-')
