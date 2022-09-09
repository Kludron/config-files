local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp-installer")
_.pyright.setup{autostart=false}
_.clangd.setup{}
