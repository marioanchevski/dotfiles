local opt = vim.opt

vim.g.mapleader = ' '

opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 5

opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true

opt.tabstop = 2 -- how many spaces the tab character looks like, purely visual
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true

opt.wrap = false
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.winborder = 'rounded'

opt.clipboard:append 'unnamedplus'
opt.colorcolumn = '80'
opt.cursorline = true
