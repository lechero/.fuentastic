local status, chatgpt = pcall(require, "chatgpt")
if (not status) then return end

FUENTASTIC_LOGO = [[
 ______  __  __   ______   __   __   ______  ______   ______   ______  __   ______
/\  ___\/\ \/\ \ /\  ___\ /\ "-.\ \ /\__  _\/\  __ \ /\  ___\ /\__  _\/\ \ /\  ___\
\ \  __\\ \ \_\ \\ \  __\ \ \ \-.  \\/_/\ \/\ \  __ \\ \___  \\/_/\ \/\ \ \\ \ \____
 \ \_\   \ \_____\\ \_____\\ \_\\"\_\  \ \_\ \ \_\ \_\\/\_____\  \ \_\ \ \_\\ \_____\
  \/_/    \/_____/ \/_____/ \/_/ \/_/   \/_/  \/_/\/_/ \/_____/   \/_/  \/_/ \/_____/
]]

chatgpt.setup()


-- require("chatgpt").setup({
--   -- optional configuration
--   welcome_message = FUENTASTIC_LOGO, -- set to "" if you don't like the fancy robot
--   loading_text = "loading",
--   question_sign = "", -- you can use emoji if you want e.g. 🙂
--   answer_sign = "ﮧ", -- 🤖
--   max_line_length = 120,
--   yank_register = "+",
--   chat_layout = {
--     relative = "editor",
--     position = "50%",
--     size = {
--       height = "80%",
--       width = "80%",
--     },
--   },
--   settings_window = {
--     border = {
--       style = "rounded",
--       text = {
--         top = " Settings ",
--       },
--     },
--   },
--   chat_window = {
--     filetype = "chatgpt",
--     border = {
--       highlight = "FloatBorder",
--       style = "rounded",
--       text = {
--         top = " ChatGPT ",
--       },
--     },
--   },
--   chat_input = {
--     prompt = "  ",
--     border = {
--       highlight = "FloatBorder",
--       style = "rounded",
--       text = {
--         top_align = "center",
--         top = " Prompt ",
--       },
--     },
--   },
--   openai_params = {
--     model = "text-davinci-003",
--     frequency_penalty = 0,
--     presence_penalty = 0,
--     max_tokens = 300,
--     temperature = 0,
--     top_p = 1,
--     n = 1,
--   },
--   openai_edit_params = {
--     model = "code-davinci-edit-001",
--     temperature = 0,
--     top_p = 1,
--     n = 1,
--   },
--   keymaps = {
--     close = { "<C-c>", "<Esc>" },
--     yank_last = "<C-y>",
--     scroll_up = "<C-u>",
--     scroll_down = "<C-d>",
--     toggle_settings = "<C-o>",
--     new_session = "<C-n>",
--     cycle_windows = "<Tab>",
--   },
-- })
