if vim.lsp.config.lua_ls then
    vim.lsp.enable('lua_ls')

    vim.lsp.config('lua_ls', {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                    checkThirdParty = false,
                },
                telemetry = { enabled = false },
            },
        },
    })
end
