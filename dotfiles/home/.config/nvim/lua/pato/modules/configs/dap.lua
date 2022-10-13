local dap = {}

dap.ui = function()
    local dap, dapui = require("dap"), require("dapui")

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

    dapui.setup({

    })
end

dap.install = function()
    local dap_buddy = require("dap-buddy")

    dap_buddy.setup({
        installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    })

    local dap_lang_lookup = {
        cpp = { "ccppr_vsc" },
        c = { "ccppr_vsc" },
        rust = { "ccppr_vsc" },
        go = { "go_delve" },
        javascript = { "chrome", "jsnode" },
        typescript = { "chrome", "jsnode" },
    }
end

return dap