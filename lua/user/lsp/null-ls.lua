local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({ --all the lsp were installed locally via npm
  debug = false,
  sources = { --check :NullLsInfo on a language to see what lsp you can use
    formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
    --formatting.black.with({ extra_args = { "--fast" } }),
    --formatting.stylua,
    diagnostics.eslint,
    diagnostics.alex, --for mdown
    diagnostics.tidy,
    diagnostics.cspell,
    --diagnostics.codespell --codespell dont work
  },
})
