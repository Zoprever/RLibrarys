funtion
-- Search UI --
local parentGui
if typeof(gethui) == "function" then
    parentGui = gethui()
else
    parentGui = game:GetService("CoreGui")
end

-- Buscar un ScreenGui existente llamado "ZorexUI"
local ScreenGui = parentGui:FindFirstChild("ZorexUI")

-- Si no existe, se crea
if not ScreenGui then
end
