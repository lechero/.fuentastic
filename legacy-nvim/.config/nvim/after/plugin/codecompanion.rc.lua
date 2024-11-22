local status, codecompanion = pcall(require, "codecompanion")
if (not status) then return end

codecompanion.setup({
  adapters = {
    lmstudio = require('adapters.lm_studio') -- Register your custom adapter
  },
  -- You can specify which adapter to use by default
  default_adapter = "lmstudio"
  -- openai_api_key = "",                                                                                              -- Leave this blank for local usage
  -- custom_openai_endpoint = "http://localhost:1234/v1",                                                              -- Point to your local server
  -- openai_default_model = "duyntnet/OpenCodeInterpreter-DS-6.7B-imatrix-GGUF/OpenCodeInterpreter-DS-6.7B-Q4_0.gguf", -- Use your local model name

  -- adapters = {
  --   ollama = function()
  --     return require("codecompanion.adapters").extend("ollama", {
  --       env = {
  --         url = "http://localhost:1234",
  --       },
  --     })
  --   end,
  -- },
  -- strategies = {
  --   chat = {
  --     adapter = 'ollama',
  --   },
  --   inline = {
  --     adapter = 'ollama',
  --   },
  --   agent = {
  --     adapter = 'ollama',
  --   },
  -- },
  -- strategies = {
  --   chat = {
  --     adapter = "ollama",
  --   },
  --   inline = {
  --     adapter = "ollama",
  --   },
  --   agent = {
  --     adapter = "anthropic",
  --   },
  -- },
})
