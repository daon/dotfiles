return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>" },
  },
  config = function()
    local nvim_tree = require("nvim-tree")

    nvim_tree.setup({
      disable_netrw = true,
      hijack_netrw = false,
      open_on_tab = false,
      hijack_cursor = false,
      update_cwd = false,
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      diagnostics = {
        enable = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      git = {
        enable = false,
      },
      update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
      },
      system_open = { cmd = nil, args = {} },
      filters = { dotfiles = false, custom = {} },
      renderer = {
        indent_markers = {
          enable = true,
        },
        -- highlight_opened_files = "all"
      },
      view = {
        width = table,
        hide_root_folder = false,
        side = "left",
        signcolumn = "no",
      },
    })
  end,
}
