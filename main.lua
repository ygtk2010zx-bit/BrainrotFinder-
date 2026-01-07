-- Normal Sunucu Fix
print("Baglanti Kuruluyor...")
repeat wait() until game:IsLoaded()

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- Hız Hilesi
char:WaitForChild("Humanoid").WalkSpeed = 70

-- Gelişmiş Toplayıcı
spawn(function()
    while true do
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v:FindFirstChild("TouchInterest") then
                firetouchinterest(char:WaitForChild("HumanoidRootPart"), v, 0)
                firetouchinterest(char:WaitForChild("HumanoidRootPart"), v, 1)
            end
        end
        wait(0.3)
    end
end)
print("Sistem Basariyla Baslatildi!")
