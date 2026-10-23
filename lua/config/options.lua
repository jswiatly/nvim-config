-- General options

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 400

vim.opt.laststatus = 2
vim.opt.showmode = false

vim.opt.completeopt = {
    "menu",
    "menuone",
    "noselect",
}

-- Window title

vim.opt.title = true
vim.opt.titlestring =
    "Neovim — %{fnamemodify(getcwd(), ':t')} — %t"

-- Statusline

vim.opt.statusline =
    " %t %m%r%=%{&filetype} %l:%c "
