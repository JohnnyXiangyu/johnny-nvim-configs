local plugins = {
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    {
        'numToStr/Comment.nvim',
        event =  "VeryLazy",
        opts = {}
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = function()
            local defaults = require "plugins.configs.nvimtree"
            defaults.actions.open_file.resize_window = false
            return defaults
        end
    },
    {
        "lewis6991/hover.nvim",
        event = "VeryLazy",
        config = function()
            require("hover").setup {
                init = function()
                    require("hover.providers.lsp")
                end,
                preview_opts = {
                    border = 'single'
                },
                -- Whether the contents of a currently open hover window should be moved
                -- to a :h preview-window when pressing the hover keymap.
                preview_window = false,
                title = true,
                mouse_providers = {
                    'LSP'
                },
                mouse_delay = 1000
            }

            -- Setup keymaps
            vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
            vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
            -- vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
            -- vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})

            -- Mouse support
            vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = "hover.nvim (mouse)" })
            vim.o.mousemoveevent = true
        end
    },
    {
        "cmake-tools.nvim",
        event = "VeryLazy",
        opts = {}
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup()
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end
      },
      {
        "nvim-neotest/nvim-nio"
      },
      {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
          "williamboman/mason.nvim",
          "mfussenegger/nvim-dap",
        },
        opts = {
          handlers = {}
        }
      },
      {
        "mfussenegger/nvim-dap",
        config = function(_, _)
          require("core.utils").load_mappings("dap")
        end
      },
      {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        opts = function()
          return require "custom.configs.null-ls"
        end
      },
      {
        "neovim/nvim-lspconfig",
        config = function()
          require "plugins.configs.lspconfig"
          require "custom.configs.lspconfig"
        end
      },
      {
        "williamboman/mason.nvim",
        opts = {
          ensure_installed = {
            "clangd",
            "clang-format",
            "codelldb"
                }
            }
        }
    }

    return plugins

