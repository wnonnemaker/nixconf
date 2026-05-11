vim.keymap.set("n", "<leader>l", ":tabnext<CR>",     { desc = "Next tab" })
vim.keymap.set("n", "<leader>h", ":tabprevious<CR>", { desc = "Prev tab" })

vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "clear search" })

vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle ZenMode" })

vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y", { desc = "copy to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", "\"+d", { desc = "delete to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p", { desc = "clear search" })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
