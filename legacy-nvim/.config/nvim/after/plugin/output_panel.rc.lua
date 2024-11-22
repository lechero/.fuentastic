local status, output_panel = pcall(require, "output_panel")
if (not status) then return end

output_panel.setup {}
