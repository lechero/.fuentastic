local status, overseer = pcall(require, "overseer")
if (not status) then return end

overseer.setup {}
