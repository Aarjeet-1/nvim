vim.opt.clipboard = "unnamedplus"

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true


vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.hlsearch = false
vim.opt.nu = true
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = false


vim.opt.termguicolors = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.backup = false


vim.opt.undofile = true


vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.splitright = true
vim.o.splitbelow = true


vim.opt.updatetime = 50

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"

require("config.lazy")
require("config.remap")
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.cmd('colorscheme tokyonight')


vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,

})


vim.keymap.set("n", "<space>pv", vim.cmd.Ex)
-- to open terminal of nvim
vim.keymap.set("n", "<space>tm", vim.cmd.term)


vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")

vim.keymap.set("n", "<space>tm", vim.cmd.term)

--vim.keymap.set("n", "-", "<cmd>Oil<CR>")
