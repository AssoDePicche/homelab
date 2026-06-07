require('assodepicche')

vim.lsp.config('luals', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc' },
})

vim.lsp.enable('luals')

vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin:' .. vim.env.PATH
