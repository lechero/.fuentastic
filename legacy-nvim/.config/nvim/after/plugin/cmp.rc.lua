local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

cmp.setup({
  snippet = {
    -- expand = function(args)
    --   require('luasnip').lsp_expand(args.body)
    -- end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'fish' },
    -- { name = "luasnip" },
    { name = "tmux" },
    -- { name = "env" },
    { name = "nerdfont" },
    -- { name = "nvim_lua" },
    -- { name = "treesitter" },
    -- { name = "cmp-tw2css" },
    { name = "cmp_tabnine" },
    { name = "cpm-cmdline" },
    { name = "path" },
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  },
  -- matching = {
  --   disallow_fuzzy_matching = true,
  --   disallow_fullfuzzy_matching = true,
  --   disallow_partial_fuzzy_matching = true,
  --   disallow_partial_matching = true,
  --   disallow_prefix_unmatching = false,
  -- },
})

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- vim.cmd [[
--   set completeopt=menuone,noinsert,noselect
--   highlight! default link CmpItemKind CmpItemMenuDefault
-- ]]
--
-- " Use <Tab> and <S-Tab> to navigate through popup menu
-- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
