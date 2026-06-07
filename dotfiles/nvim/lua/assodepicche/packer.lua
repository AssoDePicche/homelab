vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
    requires = {{'nvim-lua/plenary.nvim'}}
  }
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  })
  use 'neovim/nvim-lspconfig'
  use {
    'folke/lazydev.nvim',
    config = function()
      require('lazydev').setup({
        library = {
          {
            path = '${3rd}/luv/library', words = { 'vim%.uv' }
          },
        }
      })
    end
  }
  use {
    'saghen/blink.cmp',
    branch = 'v1',
    run = 'cargo build --release',
    config = function()
      require('blink.cmp').setup({
        keymap = { preset = 'default' },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
      })
    end
  }
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  }
  use 'mfussenegger/nvim-jdtls'
end)
