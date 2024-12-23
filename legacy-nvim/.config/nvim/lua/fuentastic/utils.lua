local fn = vim.fn

local M = {}

-- Finding os name and packer instalation path.
M.plugins_path = fn.stdpath("data") .. "/site/pack/packer"
M.os = vim.loop.os_uname().sysname

-- Check for instalation status of plugin.
function M.is_plugin_installed(plugins_name)
  if fn.empty(fn.glob(M.plugins_path .. "/start/" .. plugins_name)) > 0
      and fn.empty(fn.glob(M.plugins_path .. "/opt/" .. plugins_name)) > 0
  then
    return false
  else
    return true
  end
end

-- Functions for make mappings easier.
function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- This will add which-key mapping to given maps_list table.
function M.wk_add(mappings, options, maps_list)
  table.insert(maps_list, { mappings, options })
end

-- Function for working easier with nvim_set_hl().
function M.highlight(highlight_group, colors, opts)
  -- Function for getting default options(colors and styles) of highlight group.
  local function get_attr(attr)
    return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(highlight_group)), attr)
  end

  -- Setting previous bg and fg.
  local options = {
    bg = get_attr("bg"),
    fg = get_attr("fg"),
  }

  -- Setting some styles if they were in colorscheme for current highlight group.
  if get_attr("bold") == "1" then
    options.bold = true
  end
  if get_attr("italic") == "1" then
    options.italic = true
  end

  if get_attr("undercurl") == "1" then
    options.undercurl = true
  end
  if get_attr("underline") == "1" then
    options.underline = true
  end

  -- Adding new color if they excist.
  for k, v in pairs(colors) do
    if colors[k] == "NONE" then
      options[k] = nil
    else
      options[k] = v
    end
  end

  -- Adding new options if they excist.
  if opts then
    for k, v in pairs(opts) do
      options[k] = v
    end
  end

  -- Applying colors and options.
  vim.api.nvim_set_hl(0, highlight_group, options)
end

function M.update_neovim()
  vim.notify("Updating NeoVim.", vim.log.levels.WARN, { title = "Fuentastic" })
  if M.os == "Windows_NT" then
    vim.notify("Please check for NeoVim u.", vim.log.levels.WARN, { title = "Fuentastic" })
    if vim.fn.has("nvim-0.7.0") == "0" then
      vim.notify(
        "Please update your NeoVim. You can probably update it with opening powershell session as addministrator and running choco install --force neovim. After that open NeoVim and run :FuentasticUpdate"
        ,
        vim.log.levels.WARN,
        { title = "Fuentastic" }
      )
    end
  elseif M.os == "Linux" then
    if vim.fn.system("command -v pacman") ~= "" then
      vim.fn.system("sudo pacman -Sy neovim --noconfirm")
    elseif vim.fn.system("command -v apt-get") ~= "" then
      vim.fn.system("sudo apt update; sudo apt install neovim -y")
    elseif vim.fn.system("command -v dnf") ~= "" then
      vim.fn.system("sudo dnf update -y; sudo dnf install neovim -y")
    elseif vim.fn.system("command -v zypper") ~= "" then
      vim.fn.system("sudo zypper ref; sudo zypper -n neovim")
    elseif vim.fn.system("command -v emerge") ~= "" then
      vim.fn.system("emerge app-editors/neovim")
    end
    vim.notify("NeoVim Updated.", vim.log.levels.WARN, { title = "Fuentastic" })
  else
    vim.fn.system("brew install neovim")
    vim.notify("NeoVim Updated.", vim.log.levels.WARN, { title = "Fuentastic" })
  end
end

function M.update()
  -- M.update_neovim()

  -- Update Fuentastic via git pull --ff-only
  local Job = require("plenary.job")
  local job_status
  Job:new({
    command = "git",
    args = { "pull", "--ff-only" },
    cwd = vim.fn.stdpath("config"),
    on_exit = function(_, return_val)
      if return_val == 0 then
        job_status = 0
      else
        job_status = 1
      end
    end,
  }):sync()

  -- Show status to user
  if job_status == 0 then
    vim.api.nvim_notify("Fuentastic Updated!", vim.log.levels.WARN, { title = "Fuentastic" })
  else
    vim.notify("Update failed! Please try pulling manually.", vim.log.levels.ERROR, { title = "Fuentastic" })
  end
end

function M.esc(cmd)
  return vim.api.nvim_replace_termcodes(cmd, true, false, true)
end

function M.get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

function M.get_gps_scope(fallback)
  local gps = require('nvim-navic')
  if not gps.is_available() then
    return fallback
  end
  local scope_data = gps.get_data()
  if not scope_data or vim.tbl_isempty(scope_data) then
    return fallback
  end
  local scope_string = vim.tbl_map(function(t)
    return t.name:gsub('[\'"]', ''):gsub('%s+', ' ')
  end, scope_data)
  return table.concat(scope_string, ' > ')
end

return M
