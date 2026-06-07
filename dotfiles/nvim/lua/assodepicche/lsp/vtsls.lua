if vim.lsp.config.vtsls then
    vim.lsp.enable('vtsls')

    vim.lsp.config('vtsls', {
        settings = {
            typescript = {
                inlayHints = {
                    parameterNames = { enabled = 'all' },
                    parameterTypes = { enabled = true },
                    variableTypes = { enabled = true },
                },
            },
        },
    })
end
