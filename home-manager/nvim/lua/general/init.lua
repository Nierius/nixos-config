require("general.map")

vim.g.mapleader = " "
vim.opt.showcmd = true

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Explorer" })
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.cmd('set signcolumn=number')
