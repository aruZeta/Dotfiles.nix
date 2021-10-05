lua << EOF
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.showmode = false
vim.opt.wrap = false
vim.opt.updatetime = 300
vim.opt.encoding = 'UTF-8'
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.softtabstop = 0
vim.opt.expandtab = false
vim.opt.colorcolumn = '80'
vim.opt.filetype = 'on'
vim.opt.spelllang = { 'en', 'es' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.termguicolors = true
vim.opt.mouse = 'a'
EOF