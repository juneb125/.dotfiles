-- Keymaps --

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>wt', '<cmd>set wrap!<CR>', { silent = true, desc = "Toggle line wrapping" }) -- toggles line wrapping
-- vim.keymap.set('n', '<C-t>v', '<C-w>v<cmd>terminal<CR>', { silent = true, desc = "Open Nvim terminal emulator in new vertical split" })
-- vim.keymap.set('n', '<C-t>h', '<C-w>s<cmd>terminal<CR>', { silent = true, desc = "Open Nvim terminal emulator in new horizontal split" })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = "Exit Nvim terminal emulator without closing it" })

-- navigate Vim panes better
-- from https://github.com/typecraft-dev/dotfiles/nvim/.../vim-options.lua
vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<CR>', { silent = true, desc = "Navigate to pane above" })
vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<CR>', { silent = true, desc = "Navigate to pane below" })
vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<CR>', { silent = true, desc = "Navigate to left pane" })
vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>', { silent = true, desc = "Navigate to right pane" })

-- the following keymaps are from josean-dev/dev-environment-files on github
vim.keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>', { silent = true, desc = "Clear search highlighting" }) -- clears search highlighting

-- window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { silent = true, desc = "Close current split" }) -- close current split window

-- tab management
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { silent = true, desc = "Open new tab" }) -- open new tab
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { silent = true, desc = "Close current tab" }) -- close current tab
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { silent = true, desc = "Go to next tab" }) --  go to next tab
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { silent = true, desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { silent = true, desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- web-browser-like keymaps for tab management
vim.keymap.set('n', '<C-w>', '<cmd>tabclose<CR>', { silent = true, desc = "Close current tab" })
-- vim.keymap.set('n', '<C-Tab>', '<cmd>tabn<CR>', { silent = true, desc = "Go to next tab" }) -- ctrl tab
-- vim.keymap.set('n', '<C-`>', '<cmd>tabp<CR>', { silent = true, desc = "Go to previous tab" }) -- ctrl shift tab
