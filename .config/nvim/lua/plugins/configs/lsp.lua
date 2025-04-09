local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- Set up default LSP keybindings
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- Configure completion
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        { name = 'nvim_lsp' }, -- LSP source
        { name = 'luasnip' },  -- Snippets source
        { name = 'buffer' },   -- Buffer words
        { name = 'path' },     -- File paths
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Confirm with Enter
        ['<Tab>'] = cmp_action.luasnip_supertab(),          -- Tab for completion
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),  -- Shift+Tab backward
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

-- Configure LSP
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓", -- Icon for installed packages
            package_pending = "➜", -- Icon for pending packages
            package_uninstalled = "✗" -- Icon for uninstalled packages
        }
    },
})

require('mason-lspconfig').setup({
    ensure_installed = {
        -- Language servers
        'lua_ls',  -- Lua language server
        'ts_ls',   -- TypeScript language server
        'pyright', -- Python language server
    },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            -- Custom config for Lua LSP
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' } -- Allow 'vim' global in Lua
                        }
                    }
                }
            })
        end,
    }
})
