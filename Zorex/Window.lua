-- Loadstrings --
local Dragify = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zoprever/RLibrarys/refs/heads/main/Drag.lua"))()
-- Window --
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
ZorexUI.Name = "ZorexUI"
ZorexUI.ResetOnSpawn = false
ZorexUI.Parent = parentGui

-- Main Window
local Main = Instance.new("Frame")
Main.Name = "Window"
Main.Size = UI_SIZE
Main.Position = UI_POSITION
Main.BackgroundColor3 = Color3.fromRGB(0,0,0)
Main.BackgroundTransparency = UI_TRANSPARENCY
Main.BorderSizePixel = 0
Main.Parent = ZorexUI

-- UICorner
local UIC = Instance.new("UICorner")
UIC.CornerRadius = UDim.new(0, 12)
UIC.Parent = Main
Dragify(Main)
