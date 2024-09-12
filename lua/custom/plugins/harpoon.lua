return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('harpoon'):setup()
    end,
    keys = function()
      local harpoon = require 'harpoon'
      harpoon:setup {}
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      return {
        {
          '<leader>hm',
          function()
            require('harpoon'):list():add()
          end,
          desc = 'harpoon file',
        },
        {
          '<leader>ha',
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = 'harpoon quick menu',
        },
        {
          '<leader>h1',
          function()
            require('harpoon'):list():select(1)
          end,
          desc = 'harpoon to file 1',
        },
        {
          '<leader>h2',
          function()
            require('harpoon'):list():select(2)
          end,
          desc = 'harpoon to file 2',
        },
        {
          '<leader>h3',
          function()
            require('harpoon'):list():select(3)
          end,
          desc = 'harpoon to file 3',
        },
        {
          '<leader>h4',
          function()
            require('harpoon'):list():select(4)
          end,
          desc = 'harpoon to file 4',
        },
        {
          '<leader>h5',
          function()
            require('harpoon'):list():select(5)
          end,
          desc = 'harpoon to file 5',
        },
        {
          '<leader>hn',
          function()
            require('harpoon'):list():next()
          end,
          desc = 'harpoon next',
        },
        {
          '<leader>hp',
          function()
            require('harpoon'):list():prev()
          end,
          desc = 'harpoon previous',
        },
        {
          '<leader>ht',
          function()
            toggle_telescope(require('harpoon'):list())
          end,
          desc = 'harpoon telescope window',
        },
      }
    end,
  },
}
