vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.guifont = "Hack_Nerd_Font_Mono:h16"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.wildmenu = true
vim.opt.wildmode = "longest,list,full"

vim.opt.conceallevel = 1

-- vim.cmd [[
--   set cursorline
--   hi cursorline cterm=none term=none
--   autocmd WinEnter * setlocal cursorline
--   autocmd WinLeave * setlocal nocursorline
--   highlight CursorLine guibg=#504945 ctermbg=234
--   highlight Normal guibg=none
--   colorscheme nord
-- ]]

-- vim.cmd("autocmd!")
--
-- vim.scriptencoding = 'utf-8'
-- vim.opt.encoding = 'utf-8'
-- vim.opt.fileencoding = 'utf-8'
--
-- vim.wo.number = true
--
-- vim.opt.title = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true
-- vim.opt.hlsearch = true
-- vim.opt.backup = false
-- vim.opt.showcmd = true
-- vim.opt.cmdheight = 1
-- vim.opt.laststatus = 2
-- vim.opt.expandtab = true
-- vim.opt.scrolloff = 10
-- -- vim.opt.shell = 'fish'
-- vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
-- vim.opt.inccommand = 'split'
-- vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
-- vim.opt.smarttab = true
-- vim.opt.breakindent = true
-- vim.opt.shiftwidth = 2
-- vim.opt.tabstop = 2
-- vim.opt.wrap = false -- No Wrap lines
-- vim.opt.backspace = { 'start', 'eol', 'indent' }
-- vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
-- vim.opt.wildignore:append { '*/node_modules/*' }
--
-- -- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])
--
-- -- Turn off paste mode when leaving insert
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   pattern = '*',
--   command = "set nopaste"
-- })
--
-- -- Add asterisks in block comments
-- vim.opt.formatoptions:append { 'r' }
