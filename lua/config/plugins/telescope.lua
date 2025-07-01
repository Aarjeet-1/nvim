return {
{
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies= { 
	  'nvim-lua/plenary.nvim',
	  { 'nvim-telescope/telescope-fzf-native.nvim', build ='make'  }
      },
      config = function()
	require('telescope').setup{
	  pickers = {
	    find_files = {
	--      theme = "dropdown",
	    }
	  },
	  extensions = {
	    fzf = {}
	  }

	}
	require('telescope').load_extension('fzf')
	vim.keymap.set("n", "<space>fd",require('telescope.builtin').find_files)
	vim.keymap.set("n", "<space>fh",require('telescope.builtin').help_tags)
	

	vim.keymap.set("n", "<space>ep",function()
	  require('telescope.buildin').find_files{
	    cwd = vim.fs.joinpath(vim.fn.stdpath("data"),"lazy")

	  }
	end)

	--require"config.telescope.grep".setup()
   end
    


     }    
}

