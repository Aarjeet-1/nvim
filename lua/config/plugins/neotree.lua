--for neotree

return{
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons", 
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',

  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
	mappings = {
	  ['\\'] = 'close_window',
	},
      },
    },
  },

}
--oil vim
-- return{
--   'stevearc/oil.nvim',
--   ---@module 'oil'
--   ---@type oil.SetupOpts
--   opts = {},
--   -- Optional dependencies
--   dependencies = { { "echasnovski/mini.icons", opts = {} } },
--   -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
--   -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
--   lazy = false,
-- }
