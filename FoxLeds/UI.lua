--[[
 FoxLeds UI Library
 Note: Definitive
]]

-- Servicios
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Función para crear objetos más fácil
local function create(instance, props)
    local obj = Instance.new(instance)
    for k, v in pairs(props) do
        obj[k] = v
    end
    return obj
end

-- Ventana Principal
local ScreenGui = create("ScreenGui", {
    Parent = PlayerGui,
    Name = "FoxLedsUILib",
    ResetOnSpawn = false
})

local MainFrame = create("Frame", {
    Parent = ScreenGui,
    Size = UDim2.new(0, 300, 0, 180),
    Position = UDim2.new(0.35, 0, 0.25, 0),
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BorderSizePixel = 0,
    Name = "MainFrame",
    Active = true
})

-- Bordes redondeados
create("UICorner", {
    Parent = MainFrame,
    CornerRadius = UDim.new(0, 12)
})

-- Texto en la esquina
local Title = create("TextLabel", {
    Parent = MainFrame,
    Text = "FoxLeds UI Library",
    Size = UDim2.new(1, -10, 0, 25),
    Position = UDim2.new(0, 5, 0, 5),
    BackgroundTransparency = 1,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextSize = 16
})

-- Contenedor de botones
local TopButtons = create("Frame", {
    Parent = MainFrame,
    Size = UDim2.new(1, 0, 0, 35),
    Position = UDim2.new(0, 0, 0, 30),
    BackgroundTransparency = 1
})

-- Botón Drag
local DragBtn = create("TextButton", {
    Parent = TopButtons,
    Size = UDim2.new(0, 35, 0, 35),
    Position = UDim2.new(0.4, 0, 0, 0),
    BackgroundColor3 = Color3.fromRGB(40, 40, 40),
    Text = "+",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 20
})
create("UICorner", { Parent = DragBtn, CornerRadius = UDim.new(0, 8) })

-- Botón Ocultar
local HideBtn = create("TextButton", {
    Parent = TopButtons,
    Size = UDim2.new(0, 35, 0, 35),
    Position = UDim2.new(0.55, 0, 0, 0),
    BackgroundColor3 = Color3.fromRGB(40, 40, 40),
    Text = "–",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 20
})
create("UICorner", { Parent = HideBtn, CornerRadius = UDim.new(0, 8) })

-- Función Drag universal (PC + Móvil)
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

DragBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

DragBtn.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement 
    or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Botón Ocultar/Mostrar
local SmallBtn
HideBtn.MouseButton1Click:Connect(function()
    if MainFrame.Visible then
        MainFrame.Visible = false
        SmallBtn = create("TextButton", {
            Parent = ScreenGui,
            Size = UDim2.new(0, 50, 0, 30),
            Position = UDim2.new(0.4, 0, 0.4, 0),
            BackgroundColor3 = Color3.fromRGB(128, 0, 128),
            Text = "O",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.GothamBold,
            TextSize = 18,
            Name = "RestoreBtn"
        })
        create("UICorner", { Parent = SmallBtn, CornerRadius = UDim.new(0, 8) })

        -- Drag pequeño botón
        local dragStart2, startPos2, dragging2, dragInput2
        local function update2(input)
            local delta = input.Position - dragStart2
            SmallBtn.Position = UDim2.new(
                startPos2.X.Scale,
                startPos2.X.Offset + delta.X,
                startPos2.Y.Scale,
                startPos2.Y.Offset + delta.Y
            )
        end

        SmallBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 
            or input.UserInputType == Enum.UserInputType.Touch then
                dragging2 = true
                dragStart2 = input.Position
                startPos2 = SmallBtn.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging2 = false
                    end
                end)
            end
        end)

        SmallBtn.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement 
            or input.UserInputType == Enum.UserInputType.Touch then
                dragInput2 = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput2 and dragging2 then
                update2(input)
            end
        end)

        -- Restaurar UI
        SmallBtn.MouseButton1Click:Connect(function()
            MainFrame.Visible = true
            SmallBtn:Destroy()
        end)
    end
end)