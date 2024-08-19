require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "go",
        "json",
        "julia",
        "latex",
        "lua",
        "ocaml",
        "rust",
        "zig",
    },
    sync_install = false,
    highlight = {
        enabled = true,
        additional_vim_regex_highlighting = false,
    },
})
