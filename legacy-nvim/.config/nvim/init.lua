require('fuentastic.base')
require('fuentastic.highlights')
require('fuentastic.plugins')
require('fuentastic.maps')
-- require('fuentastic.coq')
require("fuentastic.winmove")
require("fuentastic.bufferclose")
require("fuentastic.css_to_tailwind")

vim.cmd [[
  if getcwd() ==# '/Users/miguelfuentes/.dotfiles'
    " colorscheme kanagawa
    colorscheme tokyonight-storm
  elseif getcwd() ==# '/Users/miguelfuentes/projects/yasin'
    colorscheme darcula
  else
    colorscheme catppuccin-mocha
  endif

  let g:db_ui_win_position = 'right'
]]

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

-- local has = vim.fn.has
-- local is_mac = has "macunix"
-- local is_win = has "win32"
--
-- if is_mac then
--   require('fuentastic.macos')
-- end
-- if is_win then
--   require('fuentastic.windows')
-- end
