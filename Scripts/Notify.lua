function Notify(title, content, icon, seconds)
    game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = content,
            Icon = icon,
            Duration = seconds
        })
end
function Request(Seconds, A1, A2, CB1, CB2)
    game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Request",
            Text = A1 .. " or " .. A2,
            Duration = Seconds,
            Button1 = A1,
            Button2 = A2,
            Callback = function(Answer)
                if Callback == A1 then
                    CB1()
                elseif Callback == A2 then
                    CB2()
                end
            end
            warn("Callback doesnt exist")
      })
end
