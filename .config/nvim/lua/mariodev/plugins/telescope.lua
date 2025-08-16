return {
  "nvim-telescope/telescope.nvim", tag = "0.1.8",
  config = function()
    local telescope = require "telescope"
    local builtin = require "telescope.builtin"
    local actions = require "telescope.actions"

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          }
        }
      }
    })

    -- p for project
    vim.keymap.set("n", "<leader>pf", builtin.find_files)
    vim.keymap.set("n", "<leader>pg", builtin.live_grep)
    vim.keymap.set("n", "<leader>pb", builtin.buffers)
    vim.keymap.set("n", "<leader>ph", builtin.help_tags)

    telescope.load_extension("fzf")
  end
}
