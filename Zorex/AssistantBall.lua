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

-- 🟣: Icon
for i = 1, 3 do
	local line = Instance.new("Frame")
	line.Name = "Line"..i
	line.Parent = AB
	line.Size = UDim2.new(0.6, 0, 0.08, 0)
	line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	line.BorderSizePixel = 0
	line.AnchorPoint = Vector2.new(0.5, 0.5)
	line.Position = UDim2.new(0.5, 0, (0.4 + (i-1)*0.25), 0)
end
