return {
	-- Add the community repository of plugin specifications
	"AstroNvim/astrocommunity",
	-- example of importing a plugin, comment out to use it or add your own
	-- available plugins can be found at https://github.com/AstroNvim/astrocommunity

	{ import = "astrocommunity.colorscheme.catppuccin" },
	{
		"catppuccin",
		opts = {
			flavour = "frappe",
			background = {
				light = "latte",
				dark = "mocha",
			},
			dim_inactive = {
				enabled = true,
				shade = "dark",
				percentage = 0.15,
			},
			integrations = {
				indent_blankline = {
					enabled = true,
					scope_color = "",
					colored_indent_levels = true,
				},
			},
		},
	},
	{ import = "astrocommunity.indent.indent-blankline-nvim" },
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			scope = {
				enabled = true,
				show_start = true,
				show_end = false,
				highlight = { "Function", "Label" },
			},
			indent = {
				highlight = {
					"RainbowRed",
					"RainbowYellow",
					"RainbowBlue",
					"RainbowOrange",
					"RainbowGreen",
					"RainbowViolet",
					"RainbowCyan",
				},
			},
		},
	},
	{ import = "astrocommunity.diagnostics.trouble-nvim" },
	{ import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
	{ import = "astrocommunity.editing-support.todo-comments-nvim" },
	{ import = "astrocommunity.editing-support.nvim-regexplainer" },
	{ import = "astrocommunity.register.nvim-neoclip-lua" },
	{ import = "astrocommunity.motion.mini-surround" },
	{ import = "astrocommunity.motion.nvim-spider" },
	{ import = "astrocommunity.motion.leap-nvim" },
	{ import = "astrocommunity.markdown-and-latex.glow-nvim" },
	{ import = "astrocommunity.project.project-nvim" },
	{ import = "astrocommunity.pack.bash" },
	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.cpp" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.vue" },
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.toml" },
	{ import = "astrocommunity.pack.yaml" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.lua" },

	-- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
