-- This file is responsible for making sure packer.nvim is installed.
-- Also that all the plugins I want are installed.
-- It should not handle configuring the plugins
--


local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

local use = require('packer').use

require('packer').startup(

	function()
	
		use { "nvim-telescope/telescope.nvim",
			requires = { {"nvim-lua/plenary.nvim"} },
		}
		use "preservim/nerdtree"

		use "neovim/nvim-lspconfig"
		use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
		use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	
		use 'mfussenegger/nvim-dap'
		use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
		if packer_bootstrap then
   		 	require('packer').sync()
  		end
	end
)


