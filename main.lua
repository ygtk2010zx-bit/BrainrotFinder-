-- HAFİF VE GARANTİ PANEL (404 FIX)
local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Eski paneli temizle
if PlayerGui:FindFirstChild("BrainrotGui") then
    PlayerGui.BrainrotGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BrainrotGui"
ScreenGui.Parent = PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 150)
MainFrame.Position = UDim2.new(0.5, -100, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "BRAINROT CONTROLLER"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Parent = MainFrame

-- HIZ BUTONU
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Text = "Hizli Kos (70)"
SpeedBtn.Size = UDim2.new(0.9, 0, 0, 40)
SpeedBtn.Position = UDim2.new(0.05, 0, 0.3, 0)
SpeedBtn.Parent = MainFrame
SpeedBtn.MouseButton1Click:Connect(function()
    player.Character.Humanoid.WalkSpeed = 70
end)

-- TOPLAMA BUTONU
local CollectBtn = Instance.new("TextButton")
CollectBtn.Text = "Otomatik Topla"
CollectBtn.Size = UDim2.new(0.9, 0, 0, 40)
CollectBtn.Position = UDim2.new(0.05, 0, 0.65, 0)
CollectBtn.Parent = MainFrame
CollectBtn.MouseButton1Click:Connect(function()
    _G.AutoCollect = true
    while _G.AutoCollect do
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v:FindFirstChild("TouchInterest") then
                firetouchinterest(player.Character.HumanoidRootPart, v, 0)
            end
        end
        wait(0.5)
    end
end)
