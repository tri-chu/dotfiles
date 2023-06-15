require("nvim-treesitter.configs").setup({
  ensure_installed = {"python", "cpp", "lua", "vim", "javascript", "markdown", "markdown_inline"},
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
  },
})
