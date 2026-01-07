-- BASİT VE GARANTİ PANEL
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.1, 0, 0.4, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.3
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Text = "BRAINROT PANEL"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = Frame

-- HIZ BUTONU (70 Hız yapar)
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Text = "Hizli Kos (70)"
SpeedBtn.Size = UDim2.new(1, 0, 0, 40)
SpeedBtn.Position = UDim2.new(0, 0, 0.3, 0)
SpeedBtn.Parent = Frame
SpeedBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 70
end)

-- TOPLAMA BUTONU
local CollectBtn = Instance.new("TextButton")
CollectBtn.Text = "Otomatik Topla"
CollectBtn.Size = UDim2.new(1, 0, 0, 40)
CollectBtn.Position = UDim2.new(0, 0, 0.6, 0)
CollectBtn.Parent = Frame
CollectBtn.MouseButton1Click:Connect(function()
    spawn(function()
        while true do
            for _, v in pairs(game.Workspace:GetDescendants()) do
                if v:IsA("BasePart") and v:FindFirstChild("TouchInterest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                end
            end
            wait(0.5)
        end
    end)
end)
