return require("packer").startup(function()

  -- Packer: a plugin manager for Neovim
  use 'wbthomason/packer.nvim'
  
  -- Lualine: a statusline plugin written in pure lua
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

end)
