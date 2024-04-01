-- plugin maanger
require("kirk.plugins-setup")

-- general config
require("kirk.core.options")
require("kirk.core.keymaps")
require("kirk.core.colorscheme")

-- plugins
require("kirk.plugins.comment")
require("kirk.plugins.nvim-tree")
require("kirk.plugins.lualine")
require("kirk.plugins.telescope")
require("kirk.plugins.nvim-cmp")
require("kirk.plugins.autopairs")
require("kirk.plugins.treesitter")
require("kirk.plugins.gitsigns")

-- lsp plugins
require("kirk.plugins.lsp.mason")
require("kirk.plugins.lsp.lspsaga")
require("kirk.plugins.lsp.lspconfig")
require("kirk.plugins.lsp.null-ls")

-- scala lsp (because its special)
require("kirk.plugins.nvim-metals")
