local status, picker = pcall(require, "window-picker")
if (not status) then return end

picker.setup({
  include_current_win = falsse,
  -- selection_chars = "abcdefghijklmnopqrstuvwxyz1234567890",
  selection_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
  fg_color = '#ededed',
  current_win_hl_color = '#e35e4f',
  other_win_hl_color = '#4593c8',
  show_prompt = false,
})

vim.keymap.set("n", "gs", function()
  local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })

vim.keymap.set("n", "so", function()
  local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })
