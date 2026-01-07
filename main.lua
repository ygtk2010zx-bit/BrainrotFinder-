-- Brainrot Spawner & Auto Collector
print("Brainrot Spawner Aktif Ediliyor...")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Otomatik Toplama Döngüsü
_G.SpawnerAktif = true

spawn(function()
    while _G.SpawnerAktif do
        -- Oyun içindeki 'Brainrot' eşyalarını bul ve karakterine çek
        for _, item in pairs(game.Workspace:GetChildren()) do
            if item.Name == "Brainrot" or item:FindFirstChild("TouchInterest") then
                if character:FindFirstChild("HumanoidRootPart") then
                    item.CFrame = character.HumanoidRootPart.CFrame
                end
            end
        end
        wait(0.5) -- Her yarım saniyede bir tara
    end
end)

warn("Spawner Calisiyor: Etraftaki her seyi kendine cekiyorsun!")
