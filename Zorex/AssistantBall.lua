-- Find a ScreenGUI to Connect --
loadstring(game:HttpGet("https://github.com/Zoprever/RLibrarys/blob/main/Scripts/FindUI.lua"))()

-- ✅ Ahora puedes crear tus elementos dentro del ScreenGui
local AB = Instance.new("Frame")
AB.Name = "AssistiveBall"
AB.Size = UDim2.new(0, 100, 0, 100)
AB.Position = UDim2.new(0.5, -210, 0.5, -130)
AB.BackgroundColor3 = Color3.fromRGB(0,0,0)
AB.BackgroundTransparency = 0.4
AB.BorderSizePixel = 0
AB.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = AB
