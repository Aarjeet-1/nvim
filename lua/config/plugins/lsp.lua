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
         ensure_installed = { 
             "lua_ls", 
             "gopls",
             "pyright",
             "ts_ls",
             "cssls",
             "html",
             "tailwindcss"



}
     })
   end,
 },


  {
    "neovim/nvim-lspconfig",
   dependencies = {
     "j-hui/fidget.nvim"
   },
    config = function()
      require("fidget").setup({})


   local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      vim.lsp.config("lua_ls",{
	capabilities=capabilities,

	settings = {
	  Lua = {
	    runtime = {
	      verson ='LuaJIT',
	  },
	    diagnostics = {
	      globals = { "vim" },
	    },
	  },
	},
      })

      vim.lsp.config("*",{
      capabilities=capabilities})

--       vim.lsp.config("gopls",{
--       capabilities=capabilities})
--       vim.lsp.config("ts_ls",{
--       capabilities=capabilities})
--
--  vim.lsp.config("zls",{
-- capabilities=capabilities})
--
-- vim.lsp.config("rust-analyzer",{
--       capabilities=capabilities})
--
--      vim.lsp.config("pyright", {capabilities=capabilities})
--      vim.lsp.config("ts_ls",{capabilities=capabilities})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.diagnostic.config({
	-- update_in_insert = true,
	float = {
	  focusable = false,
	  style = "minimal",
	  border = "rounded",
	  source = "always",
	  header = "",
	  prefix = "",
	},
      })
    end,
  },

}


