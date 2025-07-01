return{
{
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {'rafamadriz/friendly-snippets'},

  -- use a release tag to download pre-built binaries
  version = '1.*',
 opts = {
   keymap = { preset = 'default' },

    appearance = {
     nerd_font_variant = 'mono'
    },
    signature = {enabled = true},
    completition = { documentation = { auto_show = false, auto_show_delay_ms = 500 },
},
sources = {
  default = { 'lsp', 'path', 'snippets', 'lazydev' },
  providers = {
    lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
  },
},
snippets = { preset = 'luasnip' },

 },
},
opts_extend = { "sources.default" }
}
