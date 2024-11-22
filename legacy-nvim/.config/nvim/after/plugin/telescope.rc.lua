local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")
local lga_actions = require("telescope-live-grep-args.actions")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    k8s_commands = {
      kubeconfig = "/Users/miguelfuentes/kubeconfig", -- defaults to $HOME/.kube/config
      k8s_cmd = "kubectl" -- defaults to kubectl
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")
telescope.load_extension("live_grep_args")
telescope.load_extension('k8s_commands')
telescope.load_extension('gh')
telescope.load_extension('macros')

vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
vim.keymap.set('n', ';g', function()
  builtin.grep_string({ hidden = true })
end)
vim.keymap.set('n', ';r', function()
  builtin.live_grep({ hidden = true })
end)
vim.keymap.set('n', '\\\\', function()
  builtin.buffers()
end)
-- keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

vim.keymap.set('n', ';w', function()
  telescope.extensions.live_grep_args.live_grep_args()
end)

vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end)
vim.keymap.set('n', ';;', function()
  builtin.resume()
end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)
-- vim.keymap.set('n', ';k', function()
--   telescope.extensions.k8s_commands.k8s_edits()
-- end)
-- vim.keymap.set('n', ';kk', function()
--   telescope.extensions.k8s_commands.k8s_edits()
-- end)
-- vim.keymap.set('n', ';ke', function()
--   telescope.extensions.k8s_commands.k8s_logs()
-- end)
-- vim.keymap.set('n', ';kl', function()
--   telescope.extensions.k8s_commands.k8s_exec()
-- end)

vim.cmd [[
nnoremap ;k <cmd>lua require('telescope').load_extension('k8s_commands').k8s_edits()<cr>
nnoremap ;kl <cmd>lua require('telescope').load_extension('k8s_commands').k8s_logs()<cr>
nnoremap ;ke <cmd>lua require('telescope').load_extension('k8s_commands').k8s_exec()<cr>
]]

vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
