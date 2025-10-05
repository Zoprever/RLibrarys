function SearchForUI(NameUI)
    -- GetParent --
    local parentGui
    if typeof(gethui) == "function" then
        parentGui = gethui()
    else
        parentGui = game:GetService("CoreGui")
    end

    -- Find The ScreenGUI
    local ScreenGui = parentGui:FindFirstChild(NameUI)
    
    -- If It Doesnts Exists Then Mark Print
    if not ScreenGui then
        print("Cannot Find: " .. NameUI)
    end
end
