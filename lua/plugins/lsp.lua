return {
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    opts = {
      ui = { border = "rounded" },
      symbol_in_winbar = { enable = false },
      lightbulb = {
        enable = false,
        sign = false,
      },
      outline = {
        layout = "float",
        max_height = 0.7,
        left_width = 0.4,
      },
    },
    keys = {
      {
        "<leader>gb",
        "<Cmd>Lspsaga show_buf_diagnostics<CR>",
        mode = "n",
        noremap = true,
        silent = true,
        desc = "Diagnostics: Show buffer's (lspsaga)",
      },
      {
        "<leader>gf",
        "<Cmd>Lspsaga finder<CR>",
        mode = "n",
        noremap = true,
        silent = true,
        desc = "Find references (lspsaga)",
      },
      {
        "<leader>gp",
        "<Cmd>Lspsaga peek_definition<CR>",
        mode = "n",
        noremap = true,
        silent = true,
        desc = "Peek definition (lspsaga)",
      },
      {
        "<leader>gt",
        "<Cmd>Lspsaga peek_type_definition<CR>",
        mode = "n",
        noremap = true,
        silent = true,
        desc = "Peek type definition (lspsaga)",
      },
      {
        "<leader>go",
        "<Cmd>Lspsaga outline<CR>",
        mode = "n",
        noremap = true,
        silent = true,
        desc = "Show file outline (lspsaga) - 'e' to jump, 'o' to toggle",
      },
      {
        "<leader>ga",
        "<cmd>Lspsaga code_action<CR>",
        mode = { "n", "v" },
        desc = "Show code action (lspsaga)",
      },
    },
  },
  -- tools
  {
    "williamboman/mason.nvim",
    requires = {
      { "williamboman/mason-lspconfig.nvim" },
    },
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      ---@type lspconfig.options
      servers = {
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
      },
      setup = {},
    },
  },
}
