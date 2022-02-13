pcall(require, "luarocks.loader")

RC = {}
RC.beautiful = require("beautiful")
RC.beautiful.init(require("theme"))
RC.vars = require("modules.variables")

require("modules.layouts")
require("modules.keybinds")
require("modules.autorun")
require("modules.errors")
require("modules.statusbar")
require("modules.rules")
require("modules.signals")

root.keys(globalkeys)
