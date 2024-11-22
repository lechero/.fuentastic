local status, importCost = pcall(require, "import-cost")
if (not status) then return end

importCost.setup()
