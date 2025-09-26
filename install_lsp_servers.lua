-- This script will install the necessary LSP servers
local mason_registry = require("mason-registry")

local servers = {
    "typescript-language-server",  -- ts_ls
    "rust-analyzer",               -- rust_analyzer  
    "lua-language-server",         -- lua_ls
    "pyright",                     -- pyright
}

local function install_server(server_name)
    local package = mason_registry.get_package(server_name)
    if not package:is_installed() then
        print("Installing " .. server_name)
        package:install()
    else
        print(server_name .. " is already installed")
    end
end

for _, server in ipairs(servers) do
    if mason_registry.has_package(server) then
        install_server(server)
    else
        print("Package " .. server .. " not found in Mason registry")
    end
end

print("LSP server installation complete!")