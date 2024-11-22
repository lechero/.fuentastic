local status, obsidian = pcall(require, "obsidian")
if (not status) then return end

obsidian.setup({
  dir = "~/fuentastic",
  completion = {
    nvim_cmp = false, -- if using nvim-cmp, otherwise set to false
  },
})

vim.keymap.set("n", "gf", function()
  if obsidian.util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })
