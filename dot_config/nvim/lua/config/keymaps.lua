-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- yazi.nvim (https://github.com/mikavilpas/yazi.nvim)
map("n", "<leader>y", "<cmd>Yazi<cr>", { desc = "Yazi" })
-- Open in the current working directory
map("n", "<leader>cy", "<cmd>Yazi cwd<cr>", { desc = "Yazi cwd" })
-- NOTE: this requires a version of yazi that includes
-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
map("n", "<c-up>", "<cmd>Yazi toggle<cr>", { desc = "Resume the last yazi session" })

-- typr (https://github.com/nvzone/typr)
map("n", "<leader>t", "", { desc = "typr" })
map("n", "<leader>tt", "<cmd>Typr<cr>", { desc = "Typr" })
map("n", "<leader>ts", "<cmd>TyprStats<cr>", { desc = "TyprStats" })
