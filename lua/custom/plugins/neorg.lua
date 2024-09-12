  -- Neorg Notes Plugin
return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },

  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
    init = function()
      vim.g.maplocalleader = ","
    end,
    opts = {
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.export"] = {},    -- Adds pretty icons to your documents
        ["core.keybinds"] = {
          config = {
            default_keybinds = true,
            neorg_leader = "<leader><localleader>",
            hook = function(keybinds)
              --   keybinds.unmap("norg", "n", "gtd")
              --   keybinds.remap_event("norg", "n", "<Leader>ntd", "core.qol.todo_items.todo.task_done")
              --
              --   keybinds.unmap("norg", "n", "gtp")
              --   keybinds.remap_event("norg", "n", "<Leader>ntp", "core.qol.todo_items.todo.task_pending")
              --
              --   keybinds.unmap("norg", "n", "gtu")
              --   keybinds.remap_event("norg", "n", "<Leader>ntu", "core.qol.todo_items.todo.task_undone")
              --
              --   keybinds.unmap("norg", "n", "gtd")
              --   keybinds.remap_event("norg", "n", "<Leader>ntd", "core.qol.todo_items.todo.task_done")

              keybinds.remap_key("norg", "n", "<C-Space>", "<Leader>nt")
            end,
          },
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              thesis = "~/Notes/thesis",
              notes = "~/Notes",
            },
            default_workspace = "notes",
          },
        },
      },
    },
  },
}
