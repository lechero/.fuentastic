local utils = require("fuentastic.utils")

local M = {}

function M.node_job(opts)
  local css_string = opts.css_string
  local tailwind_config = opts.tailwind_config and opts.tailwind_config or "tailwind-workspace-preset.js"

  print("tailwind_config: " .. tailwind_config)
  local node_version = vim.fn.system("node -v")
  print("node_version: " .. node_version)
  local pwd = vim.fn.system("pwd")
  print("pwd: " .. pwd)
  local node_cmd = "node css-to-tailwind.js \"" .. css_string .. "\" \"" .. tailwind_config .. "\""
  local result = vim.fn.system(node_cmd)
  print(result)

end

function M.css_to_tailwind()
  local css = utils.get_visual_selection()
  M.node_job({ css_string = css })
end

return M
-- -- if opts.tailwind_config == nil then
-- --   local tailwind_config = 'tailwind_workspace_preset'
-- -- else
-- --   local tailwind_config = opts.tailwind_config
-- -- end
-- local cwd = vim.fn.getcwd()
--
-- local Job = require 'plenary.job'
-- local stdout_results = {}
-- local job = Job:new {
--   command = "/Users/miguelfuentes/.nvm/versions/node/v16.13.0/bin/node css_to_tailwind.js",
--   args = {},
--   cwd = cwd,
--   on_stdout = function(_, line)
--     table.insert(stdout_results, line)
--   end,
-- }
--
-- job:sync()
-- print(vim.inspect.inspect(stdout_results))
