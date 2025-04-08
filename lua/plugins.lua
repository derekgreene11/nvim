return { 
  { "github/copilot.vim", lazy = false },

  { "folke/snacks.nvim",
    priority = 1000,  -- Set priority if needed
    lazy = false,  -- Load immediately, no lazy loading
    opts = {
      -- Your configuration settings here
      bigfile = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },

      -- Set dashboard configuration correctly
      dashboard = { 
        enabled = true,
        width = 60,
        row = nil, -- dashboard position. nil for center
        col = nil, -- dashboard position. nil for center
        pane_gap = 4, -- empty columns between vertical panes
        autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
        
        -- Preset configuration for dashboard
        preset = {
          -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
          pick = nil,
          keys = {
            { icon = "󰈔 ", key = "n", desc = "New File", action = function() vim.cmd("ene | startinsert") end },
            { icon = "󰈞 ", key = "f", desc = "Find File", action = function() vim.cmd("lua Snacks.dashboard.pick('files')") end },
            { icon = "󰊢 ", key = "g", desc = "Find Text", action = function() vim.cmd("lua Snacks.dashboard.pick('live_grep')") end },
            { icon = "󰋚 ", key = "r", desc = "Recent Files", action = function() vim.cmd("lua Snacks.dashboard.pick('oldfiles')") end },
            { icon = "󰒓 ", key = "c", desc = "Config", action = function() vim.cmd("lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})") end },
            { icon = "󰁯 ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = function() vim.cmd("Lazy") end, enabled = package.loaded.lazy ~= nil },
            { icon = "󰩈 ", key = "q", desc = "Quit", action = function() vim.cmd("qa") end },
          },
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
        
        sections = {
          { section = "header" },
          {
            pane = 2,
            section = "terminal",
            cmd = "colorscript -e square",
            height = 5,
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return vim.fn.executable("git") == 1 and vim.fn.isdirectory(".git") == 1
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
    },
  },
}
