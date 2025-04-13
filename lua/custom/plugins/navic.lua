return {
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    -- init = function()
    --   require('nvim-navic').setup {
    --     lsp = {
    --       auto_attach = true,
    --     },
    --   }
    -- end,
    opts = function()
      return {
        separator = ' ',
        highlight = true,
        depth_limit = 5,
        lazy_update_context = true,
      }
    end,
  },
}
