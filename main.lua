local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedBtn = Instance.new("TextButton")
local SpawnerBtn = Instance.new("TextButton")
local ServerHopBtn = Instance.new("TextButton")

-- Menü Ayarları
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MainFrame.Name = "BrainrotMenu"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Text = "BRAINROT FINDER"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- HIZ BUTONU
SpeedBtn.Parent = MainFrame
SpeedBtn.Text = "Hizli Kosma (Aç/Kapat)"
SpeedBtn.Position = UDim2.new(0, 0, 0.2, 0)
SpeedBtn.Size = UDim2.new(1, 0, 0, 40)
SpeedBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    print("Hiz Aktif!")
end)

-- SPAWNER BUTONU
SpawnerBtn.Parent = MainFrame
SpawnerBtn.Text = "Otomatik Topla"
SpawnerBtn.Position = UDim2.new(0, 0, 0.4, 0)
SpawnerBtn.Size = UDim2.new(1, 0, 0, 40)
SpawnerBtn.MouseButton1Click:Connect(function()
    _G.Collect = true
    while _G.Collect do
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v:FindFirstChild("TouchInterest") then
                v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
        wait(0.5)
    end
end)

-- SERVER HOP BUTONU
ServerHopBtn.Parent = MainFrame
ServerHopBtn.Text = "Zengin Sunucu Bul"
ServerHopBtn.Position = UDim2.new(0, 0, 0.6, 0)
ServerHopBtn.Size = UDim2.new(1, 0, 0, 40)
ServerHopBtn.MouseButton1Click:Connect(function()
    print("Yeni sunucu araniyor...")
    -- Server hop kodun buraya tetiklenecek
end)
