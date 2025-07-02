vim.opt.clipboard = "unnamedplus"


vim.opt.shiftwidth = 2
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.hlsearch = false

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")

vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = false
vim.keymap.set("n","<space>pv", vim.cmd.Ex)

require("config.lazy")


vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open',{clear = true}),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,

})

vim.keymap.set("n", "<space>tm", vim.cmd.term)

--vim.keymap.set("n", "-", "<cmd>Oil<CR>")
