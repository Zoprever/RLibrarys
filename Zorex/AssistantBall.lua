-- Find a ScreenGUI to Connect --
loadstring(game:HttpGet("https://github.com/Zoprever/RLibrarys/blob/main/Scripts/Scripts.lua"))()

local ScreenGui = SearchForUI("ZorexUI")
-- Assistive Ball
local AB = Instance.new("Frame")
AB.Name = "AssistiveBall"
AB.Size = UDim2.new(0, 65, 0, 65)
AB.Position = UDim2.new(0, 150, 0, 200)
AB.BackgroundColor3 = Color3.fromRGB(125,80,255)
AB.BackgroundTransparency = 0.1
AB.BorderSizePixel = 0
AB.AnchorPoint = Vector2.new(0.5, 0.5)
AB.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = AB

