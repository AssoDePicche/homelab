if vim.lsp.config.clangd then
    vim.lsp.enable('clangd')

    vim.lsp.config('clangd', {
        cmd = {
            'clangd',
            '--background-index',
            '--clang-tidy',
            '--header-insertion=never'
        }
    })
end
