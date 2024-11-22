local status, neoTree = pcall(require, "neo-tree")
if (not status) then return end

local function getTelescopeOpts(state, path)
  return {
    cwd = path,
    search_dirs = { path },
    attach_mappings = function(prompt_bufnr, map)
      local actions = require "telescope.actions"
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local action_state = require "telescope.actions.state"
        local selection = action_state.get_selected_entry()
        local filename = selection.filename
        if (filename == nil) then
          filename = selection[1]
        end
        -- any way to open the file without triggering auto-close event of neo-tree?
        require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
      end)
      return true
    end
  }
end

neoTree.setup {
  source_selector = {
    winbar = false,
    statusline = false
  },
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true,
    },
    components = {
      harpoon_index = function(config, node, state)
        local Marked = require("harpoon.mark")
        local path = node:get_id()
        local succuss, index = pcall(Marked.get_index_of, path)
        if succuss and index and index > 0 then
          return {
            text = string.format(" ⥤ %d", index), -- <-- Add your favorite harpoon like arrow here
            highlight = config.highlight or "NeoTreeDirectoryIcon",
          }
        else
          return {}
        end
      end
    },
    renderers = {
      file = {
        { "icon" },
        { "name",         use_git_status_colors = true },
        { "harpoon_index" }, --> This is what actually adds the component in where you want it
        { "diagnostics" },
        { "git_status",   highlight = "NeoTreeDimText" },
      }
    }
  },
  event_handlers = {
    {
      event = "file_opened",
      handler = function(file_path)
        --auto close
        require("neo-tree").close_all()
      end
    },
    {
      event = "neo_tree_window_after_open",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd("wincmd =")
        end
      end
    },
    {
      event = "neo_tree_window_after_close",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd("wincmd =")
        end
      end
    }
  },
  default_component_configs = {
    icon = {
      folder_empty = "󰜌",
      folder_empty_open = "󰜌",
      default = "*",
      -- icon = {
      --       folder_closed = "",
      --       folder_open = "",
      --       folder_empty = "ﰊ",
      --       -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      --       -- then these will never be used.
      --       default = "*",
      --       highlight = "NeoTreeFileIcon"
      --     },
    },
    git_status = {
      symbols = {
        renamed  = "󰁕",
        unstaged = "",
      },
    },
  },
  document_symbols = {
    kinds = {
      File = { icon = "󰈙", hl = "Tag" },
      Namespace = { icon = "󰌗", hl = "Include" },
      Package = { icon = "󰏖", hl = "Label" },
      Class = { icon = "󰌗", hl = "Include" },
      Property = { icon = "󰆧", hl = "@property" },
      Enum = { icon = "󰒻", hl = "@number" },
      Function = { icon = "󰊕", hl = "Function" },
      String = { icon = "󰀬", hl = "String" },
      Number = { icon = "󰎠", hl = "Number" },
      Array = { icon = "󰅪", hl = "Type" },
      Object = { icon = "󰅩", hl = "Type" },
      Key = { icon = "󰌋", hl = "" },
      Struct = { icon = "󰌗", hl = "Type" },
      Operator = { icon = "󰆕", hl = "Operator" },
      TypeParameter = { icon = "󰊄", hl = "Type" },
      StaticMethod = { icon = '󰠄 ', hl = 'Function' },
    }
  },
  window = {
    position = "left",
    width = 40,
    auto_expand_width = true,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["o"] = "open",
      ['D'] = "diff_files",
      ["i"] = "run_command",
      -- ["t"] = "telescope_find",
      ["t"] = "telescope_grep",
      ["z"] = "none",
      ["/"] = "none",
      ["["] = "prev_source",
      ["]"] = "next_source",
    }
  },
  commands = {
    telescope_find = function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      require('telescope.builtin').find_files(getTelescopeOpts(state, path))
    end,
    telescope_grep = function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      print("path: " .. path)
      require('telescope.builtin').live_grep(getTelescopeOpts(state, path))
    end,
    run_command = function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      vim.api.nvim_input(": " .. path .. "<Home>")
    end,
    diff_files = function(state)
      local node = state.tree:get_node()
      local log = require("neo-tree.log")
      state.clipboard = state.clipboard or {}
      if diff_Node and diff_Node ~= tostring(node.id) then
        local current_Diff = node.id
        require("neo-tree.utils").open_file(state, diff_Node, open)
        vim.cmd("vert diffs " .. current_Diff)
        log.info("Diffing " .. diff_Name .. " against " .. node.name)
        diff_Node = nil
        current_Diff = nil
        state.clipboard = {}
        require("neo-tree.ui.renderer").redraw(state)
      else
        local existing = state.clipboard[node.id]
        if existing and existing.action == "diff" then
          state.clipboard[node.id] = nil
          diff_Node = nil
          require("neo-tree.ui.renderer").redraw(state)
        else
          state.clipboard[node.id] = { action = "diff", node = node }
          diff_Name = state.clipboard[node.id].node.name
          diff_Node = tostring(state.clipboard[node.id].node.id)
          log.info("Diff source file " .. diff_Name)
          require("neo-tree.ui.renderer").redraw(state)
        end
      end
    end,
  },
}

vim.keymap.set("n", "<leader>n", "<Cmd>Neotree toggle reveal<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "sb", "<Cmd>Neotree toggle show buffers right<CR>", { noremap = true, silent = true })
