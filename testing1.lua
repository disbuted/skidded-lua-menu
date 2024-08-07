local toptextupdate = getsenv(game:GetService("Players").LocalPlayer.PlayerGui.Main.TopGUI.Frame.LocalScript).UpdateText
local texttbl = {
    "bronx.lol | the BEST south bronx cheat!",
    "Thanks for using bronx.lol!",
    "Hello from newport!",
    "This shitty games anticheats ac bypass is 130 lines!",
    "RaNdOm KiLlInG / fAiL rOlEpLaY iS sTrIcTlY aGaInSt ThE rUlEs"
}
local textindex = 0
hookfunction(toptextupdate, function()
    while true do
        if textindex == 5 then textindex = 1 else textindex += 1 end
            game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.PlayerGui.Main.TopGUI.Frame.TextLabel, TweenInfo.new(0.7), {TextTransparency = 1}):Play()
            wait(0.7)
            game:GetService("Players").LocalPlayer.PlayerGui.Main.TopGUI.Frame.TextLabel.Text = texttbl[textindex]
            game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.PlayerGui.Main.TopGUI.Frame.TextLabel, TweenInfo.new(0.7), {TextTransparency = 0}):Play()

        wait(15)
    end
end)