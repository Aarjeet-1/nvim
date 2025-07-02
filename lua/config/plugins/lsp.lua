return {

   {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

-- kept it cuz might use it if i break the code..

 {
   "mason-org/mason-lspconfig.nvim",
   config = function()
     require("mason-lspconfig").setup({
ensure_installed = { "lua_ls", "gopls", "tsserver", "pyright" }
     })
   end,
 },


  {
    "neovim/nvim-lspconfig",
   dependencies = {},
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


    end,
  }
--
}


