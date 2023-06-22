require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

vim.o.autowrite = true
vim.o.autoindent = true
vim.o.confirm = true
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.tabstop = 4
vim.o.softtabstop = false

-- Hide auto complete on space
vim.api.nvim_create_autocmd({ 'TextChangedI' }, {
    pattern = { '*' },
    callback = function()
        local cmp_config = require('cmp.config')
        -- vim.v_char is the last character that was typed
        if vim.v.char == ' ' then
            cmp_config.global.completion.autocomplete = {}
        else
            cmp_config.global.completion.autocomplete = { 'TextChanged' }
        end
    end,
})
