local Adapter = {}

-- Adapter definition
Adapter.name = "LM Studio"
Adapter.url = "http://localhost:1234/v1/completions" -- Your local model's completion endpoint
Adapter.env = {
  -- No API key or env vars required for your local server
}
Adapter.headers = {
  -- If your local server requires headers, you can specify them here.
  -- For instance, if your model requires an API key, you would include it:
  -- ["Authorization"] = "Bearer " .. os.getenv("LOCAL_AI_API_KEY")
  ["Content-Type"] = "application/json"
}
Adapter.parameters = {
  -- Default parameters for the request
  model = "duyntnet/OpenCodeInterpreter-DS-6.7B-imatrix-GGUF/OpenCodeInterpreter-DS-6.7B-Q4_0.gguf",
  max_tokens = 100
}

-- Handlers for the adapter
Adapter.handlers = {
  -- Called before any request is sent
  setup = function(self)
    -- Optional setup logic before sending the request
  end,

  -- Used to format the request parameters
  form_parameters = function(self, params, messages)
    -- For this simple completion request, parameters are straightforward
    return vim.tbl_extend("force", params, {
      prompt = table.concat(vim.tbl_map(function(msg) return msg.content end, messages), "\n")
    })
  end,

  -- Format the messages array
  form_messages = function(self, messages)
    -- The messages structure for your local model may not need special formatting
    -- Return the messages array
    return { prompt = table.concat(messages, " ") }
  end,

  -- Process the API response for chat output
  chat_output = function(data)
    -- Remove any unwanted prefixes, parse JSON, and handle streaming
    local success, json_data = pcall(vim.json.decode, data)
    if not success then
      return { status = "error", output = "Error parsing JSON response" }
    end

    -- Extract the completion text
    local output = json_data.choices[1].text or "No content returned"

    return {
      status = "success",
      output = { content = output, role = "assistant" }
    }
  end,

  -- Process the API response for inline output (code completions)
  inline_output = function(data, context)
    -- Inline completions can be handled similarly to chat output
    local success, json_data = pcall(vim.json.decode, data)
    if not success then
      return "Error parsing JSON response"
    end

    -- Return the completion content directly
    return json_data.choices[1].text
  end,

  -- Handle stdout for errors or streaming data
  on_stdout = function(self, data)
    -- Parse stdout, check for errors, and log them
    local stdout_data = table.concat(data._stdout_results)
    local success, json_data = pcall(vim.json.decode, stdout_data)
    if success and json_data.error then
      -- Log any errors
      print("Error: ", json_data.error.message)
    end
  end,

  -- Optional teardown after request is complete
  teardown = function(self)
    -- Cleanup resources if necessary
  end
}

-- Return the adapter definition
return Adapter
