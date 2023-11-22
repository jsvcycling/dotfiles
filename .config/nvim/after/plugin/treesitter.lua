require("nvim-treesitter.configs").setup({
    ensure_installed = { "bash", "c", "cpp", "elixir", "json", "latex", "lua", "rust", "zig" },
    sync_install = false,
    highlight = {
        enabled = true,
        additional_vim_regex_highlighting = false,
    },
})
