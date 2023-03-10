return require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Packer manages itself, lol
    -- IDE-Features
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { 'stevearc/aerial.nvim' } -- Outline of file
    use 'tpope/vim-fugitive' -- Git stuff
    use 'nvim-lua/plenary.nvim' -- Required by Telescope
    use 'nvim-telescope/telescope.nvim' -- Nice grep interface
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { -- Wrapper that makes configuring LSP way nicer
        'junnplus/lsp-setup.nvim',
        requires = { 'neovim/nvim-lspconfig', 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' }
    }
    use 'folke/neodev.nvim' -- Automatically configures for neovim init.lua workspace and development
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/vim-vsnip' -- Dependency for above features
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use { -- Pop-up of available commands when working bindings
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {}
        end
    }
    use 'tpope/vim-surround' -- Surround words with symbols
    use 'windwp/nvim-autopairs' -- Automatically close brackets etc.
    -- Languages
    use 'sheerun/vim-polyglot' -- Works for most languages
    use 'rust-lang/rust.vim' -- More specific stuff for Rust
    use 'simrat39/rust-tools.nvim' -- ...and even more...
    use 'p00f/clangd_extensions.nvim' -- clangd extensions for C LSP
    use 'fatih/vim-go' -- Specific stuff for Go
    use 'dart-lang/dart-vim-plugin' -- Dart support
    -- Aesthetic/Appearance
    use 'nvim-lualine/lualine.nvim' -- Statusbar go brrrr
    use "lukas-reineke/indent-blankline.nvim" -- Indent guides
    use { 'stevearc/dressing.nvim' } -- Make things generally prettier
    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    -- Motion
    use 'chaoren/vim-wordmotion'
    use 'easymotion/vim-easymotion'
    -- use 'bkad/CamelCaseMotion'
end)
