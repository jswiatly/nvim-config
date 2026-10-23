-- Midnight Abyss theme

local colors = {
    bg = "#030712",
    bg_dark = "#02040A",
    bg_panel = "#070E1D",
    bg_select = "#10213B",

    fg = "#DCE7F8",
    muted = "#647895",

    blue = "#438CFF",
    cyan = "#55D8F2",
    purple = "#B7A0FF",
    green = "#86D9A7",
    yellow = "#EBCB8B",
    red = "#FF7185",

    border = "#172C4A",
}

local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end