vim.opt.list = true

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_blankline = '┆',
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = true,
    use_treesitter = true,
    use_treesitter_scope = true,
    show_first_indent_level = false,
    char_highlight_list = { "IndentBlanklineIndent1",
                            "IndentBlanklineIndent2",
                            "IndentBlanklineIndent3",
                            "IndentBlanklineIndent4",
                            "IndentBlanklineIndent5",
                            "IndentBlanklineIndent6"}
}
