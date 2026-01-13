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


}, 
     })
   end,
 },


  {
    "neovim/nvim-lspconfig",
   dependencies = {
     "j-hui/fidget.nvim",
      "stevearc/conform.nvim",

    "hrsh7th/cmp-nvim-lsp",
   },
    config = function()
      require("fidget").setup({})
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup("UserLspConfig",{}),
    callback = function (ev)
        local opts = {buffer = ev.buf, silent = true}

    end
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")
vim.lsp.config("lua_ls",{
    capabilities=capabilities,

    settings = {
        Lua = {
            runtime = {
                version ='LuaJIT',
            },
            diagnostics = {
                globals = { "vim" },

            },
        },
    },
})
--
-- vim.lsp.config("*",{
--     capabilities=capabilities})

          vim.lsp.config("gopls",{
          capabilities=capabilities})
          vim.lsp.config("ts_ls",{
          capabilities=capabilities})

     vim.lsp.config("zls",{
    capabilities=capabilities})

    vim.lsp.config("rust-analyzer",{
          capabilities=capabilities})

         vim.lsp.config("pyright", {capabilities=capabilities})
    vim.keymap.set("n", "K", vim.lsp.buf.hover,{})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    vim.lsp.enable("lua_ls")
 vim.lsp.enable("pyright")
 vim.lsp.enable("rust_analyzer")
 vim.lsp.enable("zls")

 --    vim.keymap.set("n", "[d",vim.diagnostic.goto_next,{})
 --    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev,{})
 -- vim.keymap.set("n", "ca", vim.lsp.buf.code_action,{})
 vim.keymap.set("n", "rn", vim.lsp.buf.rename,{})
 vim.keymap.set("i", "<C-h>", vim.lsp.buf.rename,{})
 vim.diagnostic.config({
     virtual_text = true,
        -- update_in_insert = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = true,
            header = "",
            prefix = "",
        },
    })
end,
  },
  {
      "folke/lazydev.nvim",
      opts ={}
  }

}

