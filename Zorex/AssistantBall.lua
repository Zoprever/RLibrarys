-- Find a ScreenGUI to Connect --
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
    print("")
end

-- ✅ Ahora puedes crear tus elementos dentro del ScreenGui
local Main = Instance.new("Frame")
Main.Name = "AssistiveBall"
Main.Size = UDim2.new(0, 420, 0, 260)
Main.Position = UDim2.new(0.5, -210, 0.5, -130)
Main.BackgroundColor3 = Color3.fromRGB(0,0,0)
Main.BackgroundTransparency = 0.4
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Main
