-- Servicios
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Colores
local COLORS = {
    ButtonDefault = Color3.fromRGB(40, 40, 40),
    ButtonActive = Color3.fromRGB(128, 0, 128),
    ToggleOff = Color3.fromRGB(40, 40, 40),
    ToggleOn = Color3.fromRGB(128, 0, 128)
}

-- Función para crear botones
function CreateButton(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.BackgroundColor3 = COLORS.ButtonDefault
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.Text = text
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    -- Acción al presionar
    btn.MouseButton1Click:Connect(function()
        -- Cambia a morado unos segundos
        local tween = TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = COLORS.ButtonActive})
        tween:Play()
        tween.Completed:Wait()
        task.delay(0.3, function()
            btn.BackgroundColor3 = COLORS.ButtonDefault
        end)
        callback()
    end)

    return btn
end

-- Función para crear toggles
function CreateToggle(parent, text, callback)
    local toggle = Instance.new("TextButton")
    toggle.Size = UDim2.new(0, 200, 0, 40)
    toggle.BackgroundColor3 = COLORS.ToggleOff
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Font = Enum.Font.GothamBold
    toggle.TextSize = 16
    toggle.Text = text
    toggle.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = toggle

    local toggled = false

    toggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        toggle.BackgroundColor3 = toggled and COLORS.ToggleOn or COLORS.ToggleOff
        callback(toggled)
    end)

    return toggle
end

-- Función para crear un slider vertical
function CreateSlider(parent)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(0, 220, 0, 200)
    sliderFrame.BackgroundTransparency = 0
    sliderFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    sliderFrame.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = sliderFrame

    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, -10, 1, -10)
    scrollFrame.Position = UDim2.new(0, 5, 0, 5)
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.ScrollBarThickness = 8
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.Parent = sliderFrame
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

    local uiList = Instance.new("UIListLayout")
    uiList.Parent = scrollFrame
    uiList.SortOrder = Enum.SortOrder.LayoutOrder
    uiList.Padding = UDim.new(0, 8)

    return {
        Frame = sliderFrame,
        Scroll = scrollFrame
    }
end

return Functions