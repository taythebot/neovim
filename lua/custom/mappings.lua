local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
    },
  },
}

M.undotree = {
  plugin = true,
  n = {},
}

M.lsp = {
  plugin = true,
  n = {
    ["<leader>lca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Selects a code action available at cursor",
    },
    ["<leader>lrr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "Lists all the references",
    },
    ["<leader>lrn"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "Renames all references",
    },
    ["<leader>lcl"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "Lists all the implementations for the symbol",
    },
  },
}

M.searchbox = {
  plugin = true,
  n = {
    ["<leader>s"] = {
      "<cmd> SearchBoxIncSearch <CR>",
      "Search and replace in buffer",
    },
  },
}

return M
