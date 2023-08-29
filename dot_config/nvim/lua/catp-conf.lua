require("catppuccin").setup {
    flavour = "frappe",
    background = { -- :h background
        light = "frappe",
        dark = "mocha",
    },
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15
    },
    transparent_background = false,
    term_colors = false,
    compile = {
        enabled = true,
        path = vim.fn.stdpath "cache" .. "/catppuccin"
    },
    integrations = {
        bufferline = true,
        treesitter = true,
        lsp_trouble = true,
        cmp = true,
        gitgutter = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = false
        },
        dap = {
            enabled = true,
            enable_ui = true
        },
        which_key = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true
        },
        markdown = true,
        mason = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        hop = true,
        notify = true,
        aerial = true
    }
}
