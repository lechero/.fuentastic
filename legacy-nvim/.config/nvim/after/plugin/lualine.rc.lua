local status, lualine = pcall(require, "lualine")
if (not status) then return end

local function current_buffer_number()
  return " " .. vim.api.nvim_get_current_buf()
end

local function session_name()
  return require('possession.session').get_session_name() or ''
end

local function copilot_indicator()
  local client = vim.lsp.get_active_clients({ name = "copilot" })[1]
  if client == nil then
    return ""
  end

  if vim.tbl_isempty(client.requests) then
    return "idle" -- default icon whilst copilot is idle
  end

  local spinners = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners

  return spinners[frame + 1]
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    always_divide_middle = false,
    -- globalstatus = true,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = { 'neo-tree' }
  },
  sections = {
    lualine_a = { 'mode' },
    -- lualine_b = { 'branch' },
    lualine_b = { current_buffer_number, 'diff',
      -- { '%{ObsessionStatus("∗∗", "󱙲")}',
      --   -- icon = ' ',
      --   -- fmt = function(stat) return '-' .. stat .. 'S' .. (stat == "[S]" and '∗∗' or 'lelel') end
      -- },
      -- { 'diagnostics', sources = { 'nvim_lsp', 'coc' } }
    },
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
      { require('NeoComposer.ui').status_recording, icon = ' ' },
    },
    lualine_x = {
      { session_name },
      { copilot_indicator },
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        }
      },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1            -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      { '%{ObsessionStatus("∗∗", "󱙲")}',
        -- icon = ' ',
        -- fmt = function(stat) return '-' .. stat .. 'S' .. (stat == "[S]" and '∗∗' or 'lelel') end
      },
    },
    lualine_b = {
      'buffers'
    },
    lualine_c = {
      {
        'datetime',
        -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
        style = 'default'
      }
    },
    lualine_x = {},
    lualine_y = {
      'branch',
    },
    lualine_z = {
      { 'tabs', mode = 1 },
    }
  },
  extensions = { 'fugitive', 'overseer' }
}
