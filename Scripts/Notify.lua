function Notify(title, content, icon, seconds)
    game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = content,
            Icon = icon,
            Duration = seconds
        })
end
