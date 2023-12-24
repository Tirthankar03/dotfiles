#local utils = require("utils")
    local utils = {}

local scopes = { o = vim.o, b = vim.bo, w = vim.wo }

function utils.opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then
    scopes["o"][key] = value
  end
end

function utils.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
return {
  "ThePrimeagen/harpoon",
  lazy = false,
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup({

      global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        -- Each branch will have it's own set of marked files
        mark_branch = true,

        -- enable tabline with harpoon marks
        tabline = false,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
      },
    })
    local keymap = vim.keymap
    keymap.set('n', '<leader>hx', require('harpoon.mark').add_file)
    keymap.set("n", "<leader>hn", require("harpoon.ui").nav_next)
    keymap.set("n", "<leader>hp", require("harpoon.ui").nav_prev)
    utils.map("n", [[<leader>hm]], ":Telescope harpoon marks<CR>")

    -- Harpoon telescope extension
    require("telescope").load_extension("harpoon")
  end,
}
