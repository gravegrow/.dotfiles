local lain = require("lain")
local cpu = lain.widget.cpu {
    settings = function()
        widget:set_markup("Cpu " .. cpu_now.usage)
    end
}

return cpu.widget
