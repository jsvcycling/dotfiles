require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "rust" },
    sync_install = false,
    highlight = {
        enabled = true,
        additional_vim_regex_highlighting = false,
    },
})
