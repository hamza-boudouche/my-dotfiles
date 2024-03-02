local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "rust",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- go
    "gopls",

    -- rust 
    "rust-analyzer",

    -- python 
    "pyright",
    "mypy",
    "ruff",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cloak = {
  enabled = true,
  cloak_character = "*",
  -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
  highlight_group = "Comment",
  patterns = {
    {
      -- Match any file starting with ".env".
      -- This can be a table to match multiple file patterns.
      file_pattern = {
        ".env*",
        "wrangler.toml",
        ".dev.vars",
      },
      -- Match an equals sign and any character after it.
      -- This can also be a table of patterns to cloak,
      -- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
      cloak_pattern = "=.+",
    },
  },
}

M.trouble = {
  icons = false,
}


return M
