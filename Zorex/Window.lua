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

-- Universal Drag
local UserInputService = game:GetService("UserInputService")

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    Main.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
