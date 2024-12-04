return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "vuki656/package-info.nvim",
    --   {
    --     "AstroNvim/astrocore",
    --     opts = {
    --       mappings = {
    --         n = {
    --           ["<Leader>fu"] = { "<Cmd>Telescope undo<CR>", desc = "Find undos" },
    --         },
    --       },
    --     },
    --   },
  },
  opts = function() require("telescope").load_extension "package_info" end,
}
