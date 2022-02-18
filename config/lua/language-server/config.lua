local lsp_config = require('lspconfig')
local nvim_completion = require('completion')

-- https://github.com/glepnir/lspsaga.nvim
-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/rcarriga/nvim-dap-ui
-- you may need to do the following to make debugging work.
-- sudo apt install lldb-11
-- sudo ln -s /usr/bin/lldb-vscode-11 /usr/bin/lldb-vscode

-- TODO: switch to either nvim-cmp or coq_nvim
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  nvim_completion.on_attach()
end

lsp_config.rust_analyzer.setup{ on_attach=on_attach }

lsp_config.clangd.setup{ cmd = { "clangd", "--background-index"  }, on_attach=on_attach }

lsp_config.ghcide.setup{ on_attach=on_attach }

lsp_config.pylsp.setup{ on_attach=on_attach }

-- debug command options: '--tsserver-log-file', vim.fn.expand('~/.cache/nvim/tsserver.log'), '--log-level', '4'
lsp_config.tsserver.setup{
  cmd = { "typescript-language-server", "--stdio" },
  on_attach=on_attach,
}

lsp_config.flow.setup{ on_attach=on_attach }

lsp_config.diagnosticls.setup{
  cmd = { "diagnostic-languageserver", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  on_attach=on_attach,
  init_options = {
    linters = {
      eslint = {
        command = "/usr/local/bin/eslint",
        rootPatterns = { ".git" },
        debounce = 100,
        args = { "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [eslint] [${ruleId}]",
          security = "severity"
        },
        securities = { ["2"] = "error", ["1"] = "warning" }
      }
    },
    filetypes = {
      typescript = "eslint",
      typescriptreact = "eslint",
      ["typescript.tsx"] = "eslint",
      typescript = "eslint",
      javascript = "eslint",
      javascriptreact = "eslint",
      ["javascript.jsx"] = "eslint"
    }
  }
}

-- uncomment to enable logging
-- vim.lsp.set_log_level("debug")
-- open logs with :lua vim.cmd('e'..vim.lsp.get_log_path())
