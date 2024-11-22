local status, ai = pcall(require, "ai")
if (not status) then return end

-- print("ai loaded")
-- set a keybinding for the OpenAider function
-- vim.api.nvim_set_keymap('n', ';o', '<cmd>lua require("aider").OpenAider()<cr>', { noremap = true, silent = true })

-- ai.setup({})
ai.setup({
  provider = "openai",
  openai = {
    -- model = "llama3.1:70b", -- You can start with smaller one like `gemma2` or `llama3.1`
    model = "duyntnet/OpenCodeInterpreter-DS-6.7B-imatrix-GGUF/OpenCodeInterpreter-DS-6.7B-Q4_0.gguf", -- Your specific model ID
    endpoint = "http://localhost:1234",                                                                -- In case you access ollama from another machine
  }
})
