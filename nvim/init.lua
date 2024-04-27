require('settings')
require('plugins')
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
require("plugin_config/completions")
require("plugin_config/lsp")
require("plugin_config/telescope")
require("plugin_config/treesitter")
require("plugin_config/undotree")
require("plugin_config/vim-fugitive")
