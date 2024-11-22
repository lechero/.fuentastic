local present, which_key = pcall(require, "which-key")
if not present then return end

which_key.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

local is_plugin_installed = require("fuentastic.utils").is_plugin_installed

if is_plugin_installed("nvim-dap") or is_plugin_installed("nvim-dap-ui") then
  local debug_maps = {
    d = {
      name = "Debugging",
    },
  }
  if is_plugin_installed("nvim-dap") then
    debug_maps.d.c = { ':lua require("dap").continue()<CR>', "Continue" }
    debug_maps.d.t = { ':lua require("dap").terminate()<CR>', "Terminate" }
    debug_maps.d.l = { ':lua require("dap").run_last()<CR>', "Run Last Debugging Config" }
    debug_maps.d.d = { ':lua require("dap").repl.open()<CR>', "Open Debug Console" }
    debug_maps.d.b = {
      name = "Breakpoint",
      t = { ':lua require("dap").toggle_breakpoint()<CR>', "Toggle" },
      c = { ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', "Set conditional" },
      l = {
        ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
        "With Log Point Message",
      },
    }
    debug_maps.d.s = {
      name = "Step",
      o = { ':lua require("dap").step_over()<CR>', "Step Over" },
      O = { ':lua require("dap").step_into()<CR>', "Step Into" },
      i = { ':lua require("dap").step_out()<CR>', "Step Out" },
      b = { ':lua require("dap").step_back()<CR>', "Step Back" },
      c = { ':lua require("dap").run_to_cursor()<CR>', "Run To Cursor" },
    }
  end
  if is_plugin_installed("nvim-dap-ui") then
    debug_maps.d.u = { ':lua require("dapui").toggle()<CR>', "Toggle UI" }
  end
  which_key.register(debug_maps, { prefix = "<leader>" })
end
