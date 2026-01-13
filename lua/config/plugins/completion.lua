return {
    {
        "hrsh7th/cmp-nvim-lsp",
        event = { "BufReadPre", "BufNewFile"}
    },

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        run = "make install_jsregexp",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "onsails/lspkind.nvim",

            --copied from theprimeagen
            config = function()
                local ls = require("luasnip")
                ls.filetype_extend("javascript", { "jsdoc" })

                --- TODO: What is expand?
                vim.keymap.set({"i"}, "<C-s>e", function() ls.expand() end, {silent = true})

                vim.keymap.set({"i", "s"}, "<C-s>;", function() ls.jump(1) end, {silent = true})
                vim.keymap.set({"i", "s"}, "<C-s>,", function() ls.jump(-1) end, {silent = true})

                vim.keymap.set({"i", "s"}, "<C-E>", function()
                    if ls.choice_active() then
                        ls.change_choice(1)
                    end
                end, {silent = true})
            end,

        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            require("luasnip.loaders.from_vscode").lazy_load()
            --require("luasnip").filetype_extend("javasccript",{"jsdoc"})

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                --sources for autocompletion
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }
                },
                    {name = "path"},
                    {
                        { name = "buffer" },
                    }),
                formatting ={
                    format = lspkind.cmp_format({
                        maxwidth = 50,
                        ellipsis_char = "...",

                    }),

                },
            })
        end,
    },
}

