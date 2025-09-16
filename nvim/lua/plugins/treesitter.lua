return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    branch = "master",
    build = ":TSUpdate",
    events = {"LazyFile", "VeryLazy"},
    lazy = vim.fn.argc(-1) == 0,
    main = "nvim-treesitter.configs",
    opts = {
        highlight = { enable = true },
        --ensure_installed = {
        --    "c",
        --    "lua",
        --   "markdown",
        --    "bash",
        --    "fish"
        --},
    }
}
