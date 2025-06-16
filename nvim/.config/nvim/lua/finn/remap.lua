-- Remaps --
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- keybind to open Netrw

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")  -- Move visual selection down
vim.keymap.set("v", "K", ":m '<-1<CR>gv=gv")  -- Move visual selection up

vim.keymap.set("n", "J", "mzJ`z")             -- Cursor stays at the same place when using J to append the next line at the end of the current one
vim.keymap.set("n", "<C-d>", "<C-d>zz")       -- Cursor stays at the center of the screen when using half page jumping
vim.keymap.set("n", "<C-u>", "<C-u>zz")       -- Cursor stays at the center of the screen when using half page jumping
vim.keymap.set("n", "n", "nzzzv")             -- Search terms stay at the center of the screen
vim.keymap.set("n", "N", "Nzzzv")             -- Search terms stay at the center of the screen

vim.keymap.set("x", "<leader>p", "\"_dP")     -- content of yanked 'foo' stays in the buffer when pasting of selected 'bar'

vim.keymap.set("n", "<leader>y", "\"+y")      -- use <leader>y to yank to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")      -- use <leader>y to yank to system clipboard
vim.keymap.set("n", "<leader>Y", "\"+Y")      -- use <leader>Y to yank to system clipboard

vim.keymap.set("n", "<leader>d", "\"_d")      -- delete to void
vim.keymap.set("v", "<leader>d", "\"_d")      -- delete to void

vim.keymap.set("n", "Q", "<nop>")             -- get rid of Ex-Mode

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- switch between tmux projects (silent)
vim.keymap.set("n", "<C-f>", "<cmd> !tmux neww tmux-sessionizer<CR>") -- switch between tmux projects

vim.keymap.set("n", "<leader>f", function()                           -- use the current lsp server for formating
  vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")                                         -- Quickfix Navigation (stays at the center of the screen)
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")                                         -- Quickfix Navigation (stays at the center of the screen)
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")                                     -- Quickfix Navigation (stays at the center of the screen)
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")                                     -- Quickfix Navigation (stays at the center of the screen)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Replace current word across the file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = false })
