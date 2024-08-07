-- g can: 698.7426147460938, 3.5371994972229004, 165.5684814453125
-- dumpster: 726.818359375, 3.4121956825256348, 212.49771118164062

-- g can: workspace.trashcan.prox.Attachment.ProximityPrompt
-- dumpster: workspace.GarbageDumpster.Attachment.ProximityPrompt
wait(3)
local mouselocation = game:GetService("UserInputService"):GetMouseLocation()
for i, v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disconnect()
end
workspace.trashcan.prox.Attachment.ProximityPrompt.HoldDuration = 0.1
workspace.GarbageDumpster.Attachment.ProximityPrompt.HoldDuration = 0.1
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("BasePart") then
        v.CanCollide = false
    end
end
function tween(inst, timetotween, property, value)
	local tweenInfo = TweenInfo.new(timetotween, Enum.EasingStyle.Linear)
	local properties = {}
	properties[property] = value
	local twen = game:GetService("TweenService"):Create(inst, tweenInfo, properties)
    twen:Play()
    return twen
end
local breakloop = false
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.Insert then breakloop = true end
end)
while task.wait() do
    keypress(Enum.KeyCode.LeftBracket)
    if breakloop then break end
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
    local tween = tween(hrp, 2, "CFrame", CFrame.new(Vector3.new(698.7426147460938, 3.5371994972229004, 165.5684814453125)))
    tween.Completed:Wait()
    if breakloop then break end
    while not game.Players.LocalPlayer.Backpack:FindFirstChild("TrashBag") do
        wait(0.5)
        fireproximityprompt(workspace.trashcan.prox.Attachment.ProximityPrompt, workspace.trashcan.prox.Attachment.ProximityPrompt.MaxActivationDistance)
    end
    if breakloop then break end
    repeat task.wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("TrashBag")
    if game.Players.LocalPlayer.Backpack:FindFirstChild("TrashBag") then
        game.Players.LocalPlayer.Backpack:FindFirstChild("TrashBag").Parent = game.Players.LocalPlayer.Character
    end

    local tween2 = game:GetService("TweenService"):Create(hrp, TweenInfo.new(2, Enum.EasingStyle.Linear), {CFrame = CFrame.new(Vector3.new(726.818359375, 3.4121956825256348, 212.49771118164062))})
    tween2:Play()
    tween2.Completed:Wait()

    wait(0.2)
    if breakloop then break end

    while game.Players.LocalPlayer.Character:FindFirstChild("TrashBag") do
        wait(0.5)
        fireproximityprompt(workspace.GarbageDumpster.Attachment.ProximityPrompt, workspace.GarbageDumpster.Attachment.ProximityPrompt.MaxActivationDistance)
    end
    if breakloop then break end

    wait(0.1)
    
end