local status, possession = pcall(require, "possession")
if (not status) then return end

local Path = require("plenary.path")

possession.setup {
  session_dir = (Path:new(vim.fn.stdpath('data')) / 'possession'):absolute(),
  silent = false,
  load_silent = true,
  debug = false,
  prompt_no_cr = false,
  autosave = {
    current = false, -- or fun(name): boolean
    tmp = false, -- or fun(): boolean
    tmp_name = 'tmp',
    on_load = true,
    on_quit = true,
  },
  commands = {
    save = 'SSave',
    load = 'SLoad',
    close = 'PossessionClose',
    delete = 'SDelete',
    show = 'PossessionShow',
    list = 'SList',
    migrate = 'PossessionMigrate',
  },
  -- hooks = {
  --   before_save = function(name) return {} end,
  --   after_save = function(name, user_data, aborted) end,
  --   before_load = function(name, user_data) return user_data end,
  --   after_load = function(name, user_data) end,
  -- },
  plugins = {
    close_windows = {
      hooks = { 'before_save', 'before_load' },
      preserve_layout = true, -- or fun(win): boolean
      match = {
        floating = true,
        buftype = {},
        filetype = {},
        custom = false, -- or fun(win): boolean
      },
    },
    delete_hidden_buffers = {
      hooks = {
        -- 'before_load',
        -- vim.o.sessionoptions:match('buffer') and 'before_save',
      },
      force = false, -- or fun(buf): boolean
    },
    nvim_tree = true,
    tabby = true,
    delete_buffers = false,
  },
}
