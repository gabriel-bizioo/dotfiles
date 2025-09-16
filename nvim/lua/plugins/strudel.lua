return {

    {
        "gruvw/strudel.nvim",
        build = "npm install",
        config = function()
            require("strudel").setup({
                ui = {
                    hide_menu_panel = true,
                    hide_top_bar = true,
                    hide_error_display = true,
                    hide_code_editor = false,
                }
            })
        end,
    }
}
