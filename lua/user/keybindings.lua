vim.g.mapleader = ","

function CustomNvimTreeOnAttach(bufnr)
    local api = require "nvim-tree.api"

    -- local function opts(desc)
    --   return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    -- end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<Leader>e', api.tree.toggle)
    -- vim.keymap.set('n', '?',     api.tree.)
  end
