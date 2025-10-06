-- Find a ScreenGUI to Connect --
loadstring(game:HttpGet("https://raw.githubusercontent.com/Zoprever/RLibrarys/refs/heads/main/Scripts/Scripts.lua"))()

local ScreenGui = SearchForUI("ZorexUI")
-- Assistive Ball
local AB = Instance.new("Frame")
AB.Name = "AssistiveBall"
AB.Size = UDim2.new(0, 65, 0, 65)
AB.Position = UDim2.new(0, 150, 0, 200)
AB.BackgroundColor3 = Color3.fromRGB(125,80,255)
AB.BackgroundTransparency = 0
AB.BorderSizePixel = 0
AB.AnchorPoint = Vector2.new(0.5, 0.5)
AB.ZIndex = 50
AB.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = AB
Dragify(AB)

-- 🟣 Icon/Text
local icon = Instance.new("TextLabel")
icon.Name = "MenuIcon"
icon.Parent = AB
icon.Size = UDim2.new(1, 0, 1, 0)
icon.BackgroundTransparency = 1
icon.Text = "☰"
icon.TextScaled = true
icon.Font = Enum.Font.SourceSansBold
icon.TextColor3 = Color3.fromRGB(255, 255, 255)
icon.ZIndex = 51
