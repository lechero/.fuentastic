local status, NeoComposer = pcall(require, "NeoComposer")
if (not status) then return end

NeoComposer.setup {

  keymaps = {
    -- play_macro = "±",
    play_macro = "Q",
    toggle_record = "<leader>q",
    toggle_macro_menu = ";q",
  }
}

-- local config = {
--   notify = true,
--   delay_timer = 150,
--   colors = {
--     bg = "#16161e",
--     fg = "#ff9e64",
--     red = "#ec5f67",
--     blue = "#5fb3b3",
--     green = "#99c794",
--   },
--   keymaps = {
--     play_macro = "Q",
--     yank_macro = "yq",
--     stop_macro = "cq",
--     toggle_record = "q",
--     cycle_next = "<c-n>",
--     cycle_prev = "<c-p>",
--     toggle_macro_menu = "<m-q>",
--   },
-- }
