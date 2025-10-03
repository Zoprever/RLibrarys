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
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ZorexUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = parentGui

-- Ventana principal
local main = Instance.new("Frame")
main.Name = "Window"
main.Size = UI_SIZE
main.Position = UI_POSITION
main.BackgroundColor3 = Color3.fromRGB(30,30,30)
main.BackgroundTransparency = UI_TRANSPARENCY
main.BorderSizePixel = 0
main.Parent = screenGui

-- Bordes redondeados
local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 12)
uicorner.Parent = main

-- Imagen de fondo (opcional, quítalo si no quieres imagen)
local bg = Instance.new("ImageLabel")
bg.Size = UDim2.new(1,0,1,0)
bg.Position = UDim2.new(0,0,0,0)
bg.Image = BACKGROUND_IMAGE
bg.BackgroundTransparency = 1
bg.ImageTransparency = 0.2 -- opacidad de la imagen
bg.ScaleType = Enum.ScaleType.Crop
bg.ZIndex = 0
bg.Parent = main
