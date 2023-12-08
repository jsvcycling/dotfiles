local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
})

local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "elixirls",
        "julials",
        "lua_ls",
        "ocamllsp",
        "pylyzer",
        "rust_analyzer",
        "texlab",
        "zls"
    },

    handlers = {
        lsp_zero.default_setup,
    },
})

local lspconfig = require("lspconfig")

local lua_opts = lsp_zero.nvim_lua_ls()
lspconfig.lua_ls.setup(lua_opts)

-- Disable inlay hints in ZLS because they seem to cause an panic.
-- ref: https://github.com/zigtools/zls/issues/1349
lspconfig.zls.setup({
    inlay_hints = {
        enabled = false,
    },
})
