function Notify(title, content, icon, seconds)
    game:GetService("StarterGui"):SetCore("SendNotification", {
          Title = title,
          Text = content,
          Icon = icon,
          Duration = seconds
      })
  end
end
function Request(Content, Seconds, B1, B2, CB)
  game:GetService("StarterGui"):SetCore("SendNotification", {
      })
end
