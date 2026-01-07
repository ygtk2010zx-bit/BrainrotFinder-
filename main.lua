local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/7Lib/UI-Library/main/Source.lua"))()
local Window = Library:CreateWindow("ICE FINDER - BRAINROT", "Steal a Brainrot", 10044538000)

local Tab = Window:CreateTab("Server Finder")
local MainSection = Tab:CreateSection("Zengin Oyuncular")

-- OYUNCU LİSTESİ VE FORCE BUTONLARI
local function updateList()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer then
            local pVal = v:FindFirstChild("leaderstats") and v.leaderstats:FindFirstChild("Power") and v.leaderstats.Power.Value or 0
            MainSection:CreateButton(v.Name .. " | " .. tostring(pVal), function()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
            end)
        end
    end
end

updateList()

local SettingsTab = Window:CreateTab("Settings")
local SettingsSection = SettingsTab:CreateSection("Hileler")

SettingsSection:CreateToggle("Chilli Booster (Auto Collect)", nil, function(State)
    _G.Collect = State
    spawn(function()
        while _G.Collect do
            for _, item in pairs(game.Workspace:GetDescendants()) do
                if item:IsA("BasePart") and item:FindFirstChild("TouchInterest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, item, 0)
                end
            end
            wait(0.1)
        end
    end)
end)

SettingsSection:CreateSlider("WalkSpeed", 16, 250, 50, false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

SettingsSection:CreateButton("Server Hop (Zengin Sunucu)", function()
    -- Sunucu değiştirme kodu buraya gelecek
end)
