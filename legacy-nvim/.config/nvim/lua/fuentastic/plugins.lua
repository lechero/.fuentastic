local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("lazy").setup({
  "rebelot/kanagawa.nvim",
  { "catppuccin/nvim",        name = "catppuccin" },
  -- 'OmniSharp/omnisharp-vim',
  -- {
  --   "OmniSharp/omnisharp-vim",
  --   init = function()
  --     require("lazyvim.util").on_attach(function(client, _)
  --       if client.name == "omnisharp" then
  --         client.server_capabilities.semanticTokensProvider = {
  --           full = vim.empty_dict(),
  --           legend = {
  --             tokenModifiers = { "static_symbol" },
  --             tokenTypes = {
  --               "comment",
  --               "excluded_code",
  --               "identifier",
  --               "keyword",
  --               "keyword_control",
  --               "number",
  --               "operator",
  --               "operator_overloaded",
  --               "preprocessor_keyword",
  --               "string",
  --               "whitespace",
  --               "text",
  --               "static_symbol",
  --               "preprocessor_text",
  --               "punctuation",
  --               "string_verbatim",
  --               "string_escape_character",
  --               "class_name",
  --               "delegate_name",
  --               "enum_name",
  --               "interface_name",
  --               "module_name",
  --               "struct_name",
  --               "type_parameter_name",
  --               "field_name",
  --               "enum_member_name",
  --               "constant_name",
  --               "local_name",
  --               "parameter_name",
  --               "method_name",
  --               "extension_method_name",
  --               "property_name",
  --               "event_name",
  --               "namespace_name",
  --               "label_name",
  --               "xml_doc_comment_attribute_name",
  --               "xml_doc_comment_attribute_quotes",
  --               "xml_doc_comment_attribute_value",
  --               "xml_doc_comment_cdata_section",
  --               "xml_doc_comment_comment",
  --               "xml_doc_comment_delimiter",
  --               "xml_doc_comment_entity_reference",
  --               "xml_doc_comment_name",
  --               "xml_doc_comment_processing_instruction",
  --               "xml_doc_comment_text",
  --               "xml_literal_attribute_name",
  --               "xml_literal_attribute_quotes",
  --               "xml_literal_attribute_value",
  --               "xml_literal_cdata_section",
  --               "xml_literal_comment",
  --               "xml_literal_delimiter",
  --               "xml_literal_embedded_expression",
  --               "xml_literal_entity_reference",
  --               "xml_literal_name",
  --               "xml_literal_processing_instruction",
  --               "xml_literal_text",
  --               "regex_comment",
  --               "regex_character_class",
  --               "regex_anchor",
  --               "regex_quantifier",
  --               "regex_grouping",
  --               "regex_alternation",
  --               "regex_text",
  --               "regex_self_escaped_character",
  --               "regex_other_escape",
  --             },
  --           },
  --           range = true,
  --         }
  --       end
  --     end)
  --   end,
  -- },
  'doums/darcula',
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  'nvim-lualine/lualine.nvim',
  'nvim-lua/plenary.nvim',
  'onsails/lspkind-nvim',
  'joshuavial/aider.nvim',

  -- 'hrsh7th/cmp-buffer',
  -- 'hrsh7th/cmp-nvim-lsp',
  -- 'hrsh7th/cmp-nvim-lua',
  -- 'hrsh7th/cmp-path',
  -- 'saadparwaiz1/cmp_luasnip',
  -- 'andersevenrud/cmp-tmux',
  -- { 'tzachar/cmp-tabnine', build = './install.sh' },
  -- 'hrsh7th/nvim-cmp',
  -- { "mtoohey31/cmp-fish",     name = "fish" },
  -- 'ray-x/cmp-treesitter',
  -- 'bydlw98/cmp-env',
  -- 'chrisgrieser/cmp-nerdfont',
  -- "jcha0713/cmp-tw2css",

  'neovim/nvim-lspconfig',
  'jose-elias-alvarez/null-ls.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  "zbirenbaum/copilot.lua",

  -- 'glepnir/lspsaga.nvim',
  -- 'kkharji/lspsaga.nvim',
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        server_filetype_map = {
          typescript = 'typescript'
        }
      })
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons' -- optional
    }
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      {
        "stevearc/dressing.nvim",
        opts = {},
      },
    },
    config = true
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
      { 'avneesh0612/react-nextjs-snippets' },
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  {
    "magicalne/nvim.ai",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    -- opts = {
    --   provider = "anthropic", -- LM Studio mimics OpenAI API
    --   -- openai_base_url = "http://localhost:1234/v1",                                                      -- Your LM Studio local API endpoint
    --   -- api_key = "not-needed",                                                                            -- LM Studio does not need an API key
    --   -- model = "duyntnet/OpenCodeInterpreter-DS-6.7B-imatrix-GGUF/OpenCodeInterpreter-DS-6.7B-Q4_0.gguf", -- Your specific model
    -- }
  },
  -- {
  --   "magicalne/nvim.ai",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   opts = {
  --     provider = "custom", -- You can configure your provider, model or keymaps here.
  --   }
  -- },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "canary",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
  --     { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
  --   },
  --   build = "make tiktoken",        -- Only on MacOS or Linux
  --   opts = {
  --     -- See Configuration section for options
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          php = { "php" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
        notify_on_error = true,
        formatters = {
          php = {
            command = "php-cs-fixer",
            args = {
              "fix",
              "$FILENAME",
              -- "--config=/your/path/to/config/file/[filename].php",
              -- "--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
            },
            stdin = false,
          }
        }
      })
    end,
  },

  -- 'nvim-treesitter/nvim-treesitter-context',
  'nvim-treesitter/nvim-treesitter-textobjects',

  'nvim-tree/nvim-web-devicons',
  'nvim-telescope/telescope.nvim',
  "nvim-telescope/telescope-live-grep-args.nvim",
  'nvim-telescope/telescope-file-browser.nvim',
  "nvim-telescope/telescope-github.nvim",

  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  {
    'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  },
  'norcalli/nvim-colorizer.lua',
  -- 'nvim-tree/nvim-tree.lua',
  "nvim-neo-tree/neo-tree.nvim",
  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim',
  'theprimeagen/harpoon',
  -- {
  --   "ThePrimeagen/harpoon",
  --   branch = "harpoon2",
  --   dependencies = { "nvim-lua/plenary.nvim" }
  -- },
  "ThePrimeagen/refactoring.nvim",
  'tpope/vim-fugitive',
  'tpope/vim-abolish',
  'tpope/vim-unimpaired',
  'tpope/vim-dadbod',
  'tpope/vim-surround',
  'tpope/vim-markdown',
  'tpope/vim-obsession',
  'tpope/vim-dotenv',
  'tpope/vim-speeddating',
  'tpope/vim-repeat',
  'kristijanhusak/vim-dadbod-ui',
  'voldikss/vim-floaterm',
  -- 'renerocksai/telekasten.nvim',
  'christoomey/vim-system-copy',
  'folke/which-key.nvim',
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
  },
  'folke/todo-comments.nvim',
  'goolord/alpha-nvim',
  "lewis6991/impatient.nvim",
  "jbyuki/venn.nvim",

  -- "github/copilot.vim",
  'jackMort/ChatGPT.nvim',
  'MunifTanjim/nui.nvim',
  'mbbill/undotree',
  'jedrzejboczar/possession.nvim',
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  's1n7ax/nvim-window-picker',
  { 'Wansmer/treesj',     dependencies = 'nvim-treesitter' },
  { "cshuaimin/ssr.nvim", module = "ssr" },
  'simrat39/symbols-outline.nvim',
  { 'barrett-ruth/import-cost.nvim',  build = 'sh install.sh yarn' },
  "dnlhc/glance.nvim",
  'xorid/swap-split.nvim',
  { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' },
  -- "rest-nvim/rest.nvim",
  'mfussenegger/nvim-dap',
  "ravenxrz/DAPInstall.nvim",
  "rcarriga/nvim-dap-ui",
  'David-Kunz/jester',
  { 'akinsho/flutter-tools.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  'skanehira/k8s.vim',
  'frenchtoasters/telescope-kubectl.nvim',
  'pwntester/octo.nvim',

  'fuentastic/nvim-spectre',
  'rbong/vim-flog',
  'sudormrfbin/cheatsheet.nvim',
  'kkharji/sqlite.lua',
  'ecthelionvi/NeoComposer.nvim',
  { 'AckslD/muren.nvim',          config = true },
  'stevearc/oil.nvim',
  'stevearc/overseer.nvim',
  'stevearc/dressing.nvim',
  "mhanberg/output-panel.nvim",
  -- { "sourcegraph/sg.nvim", build = "cargo build --workspace" },

  'toppair/reach.nvim',
  -- 'crusj/bookmarks.nvim',
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = { "BufReadPre " .. vim.fn.expand "~" .. "/fuentastic/**.md" },
  },

  "gbprod/yanky.nvim",
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
    },
  },
  {
    'glacambre/firenvim',

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end
  }
  -- { 'ms-jpq/coq.thirdparty', branch = '3p' },
  -- { 'ms-jpq/coq_nvim',       branch = 'coq' },
  -- { 'ms-jpq/coq.artifacts',  branch = "artifacts" }
})

-- {
--   'LukasPietzschmann/telescope-tabs',
--   dependencies = { 'nvim-telescope/telescope.nvim' },
--   config = function()
--     require 'telescope-tabs'.setup {
--
--     }
--   end
-- },
--
