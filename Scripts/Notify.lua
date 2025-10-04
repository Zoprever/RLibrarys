function Notify(title, content, icon, duration)
  game:GetService("StarterGui"):SetCore("SendNotification", {
      Title = title,
      Text = content
      Icon = icon,
      Duration = duration
  })
end
