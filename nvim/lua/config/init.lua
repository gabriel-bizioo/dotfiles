-- If loadall is set to true then all keymaps will be initiliazed.
-- Otherwise, load only the files listed manually
-- Variable to edit
local loadall = false
local path = (debug.getinfo(1, "S").source:sub(2):match("(.*/)") or "./") .. "keymaps"
local required = {}

if loadall then
    for file in io.popen("ls -pa " .. path .. " | grep -v /"):lines() do
        table.insert(required, string.sub(file, 0, -5))
    end
else
    required = {
        "neotree",
        "telescope"
    }
end

for _, file in ipairs(required) do
    require("config.keymaps." .. file)
end
