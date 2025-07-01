return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },


  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "gopls", "ts_ls", "pyright" }
      })
    end
  },


  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' ,},
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({


	settings = {
	  Lua = {
	    diagnostics = {
	      globals = { "vim" },
	    },
	  },
	},
      })
      lspconfig.gopls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.ts_ls.setup({})


    end
  }

}









