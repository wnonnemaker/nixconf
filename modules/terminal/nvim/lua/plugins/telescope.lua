local telescope = require("telescope")

telescope.setup({
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.8,
    },
    mappings = {
      i = {
        ["<CR>"] = require("telescope.actions").select_tab,
      },
      n = {
        ["<CR>"] = require("telescope.actions").select_tab,
      },
    },
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader> ", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>g", builtin.live_grep,  { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Find buffers" })
