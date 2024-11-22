local status, reach = pcall(require, "reach")
if (not status) then return end

reach.setup {}
