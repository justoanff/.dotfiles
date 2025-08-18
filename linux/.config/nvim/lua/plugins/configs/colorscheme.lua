require("tokyonight").setup({
    style = "night",          -- Select night style variant
    transparent = true,       -- Enable transparency
    styles = {
        sidebars = "transparent", -- Transparent sidebars
        floats = "transparent", -- Transparent floating windows
    },
})

vim.cmd.colorscheme "tokyonight" -- Set colorscheme
