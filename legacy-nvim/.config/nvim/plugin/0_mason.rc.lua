local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({
  ensure_installed = { "lua_ls", "tsserver", "tailwindcss", "pylsp" }
})

lspconfig.setup {
  automatic_installation = true
}
