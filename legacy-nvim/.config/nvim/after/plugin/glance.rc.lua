local status, glance = pcall(require, "glance")
if (not status) then return end

glance.setup()
local keymap = vim.keymap

keymap.set('n', 'gD', '<CMD>Glance definitions<CR>')
keymap.set('n', 'gr', '<CMD>Glance references<CR>')
keymap.set('n', 'gY', '<CMD>Glance type_definitions<CR>')
keymap.set('n', 'gM', '<CMD>Glance implementations<CR>')
