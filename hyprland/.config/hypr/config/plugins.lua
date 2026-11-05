-- Plugin-Pfad hinzufügen
package.path = package.path .. ";./?.lua;./?/init.lua"

-- Split Monitor Workspaces laden
local smw = require("plugins.split-monitor-workspaces")

-- Plugin konfigurieren
smw.setup({
    workspace_count = 10,
})
