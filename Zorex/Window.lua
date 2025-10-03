-- Window --
local BACKGROUND_IMAGE = "rbxassetid://121733512083018"
local UI_SIZE = UDim2.new(0, 420, 0, 260)
local UI_POSITION = UDim2.new(0.5, -210, 0.5, -130)
local UI_TRANSPARENCY = 0.4
local parentGui
if typeof(gethui) == "function" then
    parentGui = gethui()
else
    parentGui = game:GetService("CoreGui")
end

-- ScreenGui
local ZorexUI = Instance.new("ScreenGui")
screenGui.Name = "ZorexUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = parentGui

-- Main Window
local Main = Instance.new("Frame")
main.Name = "Window"
main.Size = UI_SIZE
main.Position = UI_POSITION
main.BackgroundColor3 = Color3.fromRGB(0,0,0)
main.BackgroundTransparency = UI_TRANSPARENCY
main.BorderSizePixel = 0
main.Parent = screenGui

-- UICorner
local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 12)
uicorner.Parent = main
