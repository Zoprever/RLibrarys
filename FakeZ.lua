--// UI Library - FakeZ ui
local UILibrary = {}

-- Ui Creating
function UILibrary:CreateUI()
    local UiBox = Instance.new("ScreenGui")
    UiBox.Name = "UiBox"
    UiBox.ResetOnSpawn = false
    UiBox.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    UiBox.Parent = game:GetService("CoreGui")

    local FrameScreen = Instance.new("Frame")
    FrameScreen.Name = "FrameScreen"
    FrameScreen.Size = UDim2.new(0, 300, 0, 200)
    FrameScreen.Position = UDim2.new(0.5, 0, 0.5, 0)
    FrameScreen.AnchorPoint = Vector2.new(0.5, 0.5)
    FrameScreen.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    FrameScreen.BorderSizePixel = 0
    FrameScreen.Parent = UiBox

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 16)
    corner.Parent = FrameScreen

    -- Paso 2: Botón de mostrar/ocultar
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 32, 0, 32)
    ToggleBtn.Position = UDim2.new(1, -40, 0, 8)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(140, 50, 255)
    ToggleBtn.Text = "≡"
    ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.TextSize = 20
    ToggleBtn.Parent = FrameScreen

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(1, 0)
    btnCorner.Parent = ToggleBtn

    local TweenService = game:GetService("TweenService")
    local open = true

    ToggleBtn.MouseButton1Click:Connect(function()
        open = not open
        local tween = TweenService:Create(
            FrameScreen,
            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                Position = open and UDim2.new(0.5, 0, 0.5, 0)
                    or UDim2.new(0.5, 0, 1.5, 0)
            }
        )
        tween:Play()
    end)

    -- Paso 3: Botón redondo de Drag
    local DragBtn = Instance.new("TextButton")
    DragBtn.Size = UDim2.new(0, 32, 0, 32)
    DragBtn.Position = UDim2.new(0, 8, 0, 8)
    DragBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    DragBtn.Text = ""
    DragBtn.Parent = FrameScreen

    local dragCorner = Instance.new("UICorner")
    dragCorner.CornerRadius = UDim.new(1, 0)
    dragCorner.Parent = DragBtn

    -- Drag solo desde el botón
    local UIS = game:GetService("UserInputService")
    local dragging = false
    local dragInput, dragStart, startPos

    DragBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = FrameScreen.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    DragBtn.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            FrameScreen.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Paso 4: Funciones Auxiliares
    local UI = {}

    function UI:AddLabel(text)
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -20, 0, 30)
        label.Position = UDim2.new(0, 10, 0, 50)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.GothamSemibold
        label.TextSize = 16
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = FrameScreen
        return label
    end

    function UI:GetMainFrame()
        return FrameScreen
    end

    function UI:GetScreen()
        return UiBox
    end

    return UI
end

return UILibrary
