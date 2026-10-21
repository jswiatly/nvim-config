
-- =========================================================
-- Midnight Abyss | Neovim 0.11+
-- Windows CMD | OLED | C/C++
-- =========================================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.termguicolors = true

-- Window title
vim.opt.title = true
vim.opt.titlestring =
    "Neovim — %{fnamemodify(getcwd(), ':t')} — %t"

-- =========================================================
-- Midnight Abyss palette
-- =========================================================

local colors = {
    bg        = "#030712",
    bg_dark   = "#02040A",
    bg_panel  = "#070E1D",
    bg_select = "#10213B",
    fg        = "#DCE7F8",
    muted     = "#647895",
    blue      = "#438CFF",
    cyan      = "#55D8F2",
    purple    = "#B7A0FF",
    green     = "#86D9A7",
    yellow    = "#EBCB8B",
    red       = "#FF7185",
    border    = "#172C4A",
}

local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hl("Normal",       { fg = colors.fg, bg = colors.bg })
hl("NormalNC",     { fg = colors.fg, bg = colors.bg })
hl("NormalFloat",  { fg = colors.fg, bg = colors.bg_panel })
hl("FloatBorder",  { fg = colors.border, bg = colors.bg_panel })
hl("SignColumn",   { bg = colors.bg })
hl("EndOfBuffer",  { fg = colors.bg })
hl("LineNr",       { fg = "#354766", bg = colors.bg })
hl("CursorLine",   { bg = "#091326" })
hl("CursorLineNr", { fg = colors.cyan, bold = true })
hl("Visual",       { bg = colors.bg_select })
hl("Search",       { fg = colors.bg_dark, bg = colors.yellow })
hl("IncSearch",    { fg = colors.bg_dark, bg = colors.cyan })
hl("Pmenu",        { fg = colors.fg, bg = colors.bg_panel })
hl("PmenuSel",     { fg = colors.cyan, bg = colors.bg_select, bold = true })
hl("WinSeparator", { fg = colors.border, bg = colors.bg })
hl("Directory",    { fg = colors.blue, bold = true })
hl("Title",        { fg = colors.cyan, bold = true })
hl("MatchParen",   { fg = colors.yellow, bold = true, underline = true })

-- Syntax
hl("Comment",    { fg = colors.muted, italic = true })
hl("String",     { fg = colors.green })
hl("Character",  { fg = colors.green })
hl("Number",     { fg = colors.purple })
hl("Boolean",    { fg = colors.purple })
hl("Constant",   { fg = colors.purple })
hl("Function",   { fg = colors.cyan })
hl("Statement",  { fg = colors.blue })
hl("Keyword",    { fg = colors.blue, italic = true })
hl("Type",       { fg = colors.yellow })
hl("Special",    { fg = colors.cyan })
hl("Operator",   { fg = "#8BA9D6" })
hl("Identifier", { fg = colors.fg })
hl("PreProc",    { fg = colors.purple })
hl("Error",      { fg = colors.red, bold = true })
hl("Todo",       { fg = colors.yellow, bold = true })

-- Statusline
hl("StatusLine",   { fg = colors.fg, bg = colors.bg_panel })
hl("StatusLineNC", { fg = colors.muted, bg = colors.bg_dark })

vim.opt.statusline =
    "  %t %m%r%=%{&filetype}  %l:%c  "
-- =========================================================
-- lazy.nvim bootstrap
-- =========================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- =========================================================
-- Plugins
-- =========================================================

require("lazy").setup({
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        lazy = false,

        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },

        opts = {
            close_if_last_window = true,
            enable_git_status = true,
            enable_diagnostics = false,

            default_component_configs = {
                indent = {
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                },

                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "",
                    default = "",
                },

                git_status = {
                    symbols = {
                        added     = "+",
                        modified  = "~",
                        deleted   = "✖",
                        renamed   = "➜",
                        untracked = "?",
                        ignored   = "◌",
                        unstaged  = "!",
                        staged    = "✓",
                        conflict  = "!",
                    },
                },
            },

            window = {
                position = "left",
                width = 34,

                mappings = {
                    ["<space>"] = "none",
                    ["<cr>"] = "open",
                    ["o"] = "open",
                    ["s"] = "open_split",
                    ["v"] = "open_vsplit",
                    ["h"] = "close_node",
                    ["l"] = "open",
                    ["a"] = "add",
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                },
            },

            filesystem = {
                follow_current_file = {
                    enabled = true,
                },

                use_libuv_file_watcher = true,

                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },

                hijack_netrw_behavior = "open_default",
            },

            git_status = {
                window = {
                    position = "float",
                },
            },
        },
    },
})

-- =========================================================
-- Neo-tree colors
-- =========================================================

hl("NeoTreeNormal", {
    fg = colors.fg,
    bg = colors.bg_dark,
})

hl("NeoTreeNormalNC", {
    fg = colors.muted,
    bg = colors.bg_dark,
})

hl("NeoTreeEndOfBuffer", {
    fg = colors.bg_dark,
    bg = colors.bg_dark,
})

hl("NeoTreeCursorLine", {
    bg = colors.bg_select,
})

hl("NeoTreeRootName", {
    fg = colors.cyan,
    bold = true,
})

hl("NeoTreeDirectoryName", {
    fg = colors.blue,
})

hl("NeoTreeDirectoryIcon", {
    fg = colors.cyan,
})

hl("NeoTreeFileName", {
    fg = colors.fg,
})

hl("NeoTreeGitModified", {
    fg = colors.yellow,
})

hl("NeoTreeGitAdded", {
    fg = colors.green,
})

hl("NeoTreeGitUntracked", {
    fg = colors.purple,
})

-- =========================================================
-- Keymaps
-- =========================================================

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

-- =========================================================
-- Startup
-- =========================================================

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.schedule(function()
            if vim.fn.argc() == 0 then
                vim.cmd("Neotree show")
            end
        end)
    end,
})

