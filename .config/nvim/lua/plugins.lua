return require("packer").startup(function()

    -- Packer: a plugin manager for Neovim
    use { 
        'wbthomason/packer.nvim'
    }

    -- Lualine: a statusline plugin written in pure lua
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Nvim-Tree: a file explorer tree for neovim written in lua
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function() require'nvim-tree'.setup {} end
    }

    -- Nvim-Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Nvim-TSRainbow: rainbow parentheses for neovim using tree-sitter
    use {
        'p00f/nvim-ts-rainbow'
    }

    -- Nvim-Autopairs: autopairs for neovim written by lua
    use { 
        'windwp/nvim-autopairs'
    }

    -- Github theme
    use { 
        use "projekt0n/github-nvim-theme"
    }

end)
