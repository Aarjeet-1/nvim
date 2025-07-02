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
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
capabilities=capabilities,

	settings = {
	  Lua = {
	    diagnostics = {
	      globals = { "vim" },
	    },
	  },
	},
      })
      lspconfig.gopls.setup({capabilities=capabilities})
      lspconfig.pyright.setup({capabilities=capabilities})
      lspconfig.ts_ls.setup({capabilities=capabilities})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

    end,
  }
--
}


