local wezterm = require("wezterm")

---@class tab_key_mappings_module
local M = {}

-- @param config table The wezterm configuration table to be modified
function M.apply_to_config(config)
    -- Ensure `keys` table exists in `config` or initialize it
    config.keys = config.keys or {}

    -- Append the tab key mappings (ALT + [0-9] to activate tabs)
    for i = 0, 9 do
        table.insert(config.keys, {
            key = tostring(i),
            mods = "ALT",
            action = wezterm.action.ActivateTab((i == 0) and 9 or i - 1),
        })
    end
end

return M
