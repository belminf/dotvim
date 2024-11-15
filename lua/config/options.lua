vim.opt.mouse = "chr"
vim.g.autoformat = false
vim.opt.clipboard = ""
vim.wo.relativenumber = false
vim.opt.listchars:append {
  tab = ".┈"
}

-- paths
vim.opt.undodir = vim.fn.stdpath("config") .. "/local/undo"
vim.opt.backupdir = vim.fn.stdpath("config") .. "/local/backup"
vim.opt.directory = vim.fn.stdpath("config") .. "/local/swap"
vim.opt.viewdir = vim.fn.stdpath("config") .. "/local/views"
