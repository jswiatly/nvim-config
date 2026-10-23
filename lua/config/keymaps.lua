-- Toggle file explorer

vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", {
    desc = "Toggle file explorer",
    silent = true,
})

-- Navigate between windows

vim.keymap.set("n", "<C-h>", "<C-w>h", {
    desc = "Move to left window",
})

vim.keymap.set("n", "<C-j>", "<C-w>j", {
    desc = "Move to lower window",
})

vim.keymap.set("n", "<C-k>", "<C-w>k", {
    desc = "Move to upper window",
})

vim.keymap.set("n", "<C-l>", "<C-w>l", {
    desc = "Move to right window",
})

-- Save file

vim.keymap.set("n", "<C-s>", "<cmd>write<CR>", {
    desc = "Save file",
})

-- Clear search highlight

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
    desc = "Clear search highlight",
})

-- Preserve selection while indenting

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
