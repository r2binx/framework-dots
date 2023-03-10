require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})

require('lsp-setup').setup({
    installer = {},
    default_mappings = false,
    mappings = {
        ['<leader>gD'] = 'lua vim.lsp.buf.declaration()',
        ['<leader>gd'] = 'lua vim.lsp.buf.definition()',
        ['<leader>k'] = 'lua vim.lsp.buf.hover()',
        ['<leader>rn'] = 'lua vim.lsp.buf.rename()',
        ['<leader>ca'] = 'lua vim.lsp.buf.code_action()',
        ['<leader>fo'] = 'lua vim.lsp.buf.format()',
    },
    -- Global on_attach
    on_attach = function(client, bufnr)
        require('lsp-setup.utils').format_on_save(client)
        vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function()
                local opts = {
                    focusable = false,
                    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                    border = 'rounded',
                    source = 'always',
                    prefix = ' ',
                    scope = 'cursor',
                }
                vim.diagnostic.open_float(nil, opts)
            end
        })
    end,
    -- Global capabilities
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    -- LSP servers
    servers = {
        -- Install LSP servers automatically
        -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        cssls = {
            settings = {
                css = {
                    validate = true,
                },
            }
        },
        sumneko_lua = {
            settings = {
                Lua = {
                    format = {
                        enable = true,
                    }
                }
            }
        },
        pyright = {
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        useLibraryCodeForTypes = true
                    }
                }
            }
        },
        -- Python formatting only with pyright instead of lsp
        -- diagnosticls = {
        --     settings = {
        --         init_options = {
        --             formatters = {
        --                 black = {
        --                     command = "black",
        --                     args = { "--quiet", "-" },
        --                     rootPatterns = { "pyproject.toml" },
        --                 },
        --                 yapf = {
        --                     command = "yapf",
        --                     args = { "--quiet", "-i" },
        --                 },
        --                 formatFiletypes = {
        --                     python = { "yapf" }
        --                 }
        --             }
        --         }
        --     }
        -- },
        clangd = require('lsp-setup.clangd_extensions').setup({}),
        rust_analyzer = require('lsp-setup.rust-tools').setup({
            server = {
                settings = {
                    ['rust-analyzer'] = {
                        cargo = {
                            loadOutDirsFromCheck = true,
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            },
        }),
    },
})
