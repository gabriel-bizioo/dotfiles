return {
    {
        "neovim/nvim-lspconfig",
        dependecies = {
            "mason.nvim",
            {"mason-org/mason-lspconfig.nvim", config = function() end},
        },
        opts = {
            servers = {
                lua_ls = {},
                pyright = {},
                ts_ls = {},
                rust_analyzer = {},
                clangd = {},
            }
        },
        config = function(_, opts)
            local lsp = vim.lsp
            local blink = require('blink.cmp')
            for server, config in pairs(opts.servers) do
                -- passing config.capabilities to blink.cmp merges with the capabilities in your
                -- `opts[server].capabilities, if you've defined it
                config.capabilities = blink.get_lsp_capabilities(config.capabilities)
                lsp.config(server, config)
                lsp.enable(server)
            end
        end
    }
}
