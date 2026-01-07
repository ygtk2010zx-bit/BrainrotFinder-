local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

-- Ayarlar
local HEDEF_DEGER = 20000000 -- 20M ve üzeri pet/değer arar

function ServerHop()
    print("Aranan bulunamadi, yeni sunucuya geciliyor...")
    local success, result = pcall(function()
        local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"))
        for _, s in pairs(Servers.data) do
            if s.playing < s.maxPlayers and s.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id)
                return
            end
        end
    end)
end

print("Sunucu kontrol ediliyor...")

-- Sunucudaki en yüksek değeri kontrol etme (Örnek mantık)
local bulundu = false
for _, v in pairs(game.Players:GetPlayers()) do
    -- Buradaki 'leaderstats.Para' kısmını oyunun kendi değer ismiyle değiştirebiliriz
    local stats = v:FindFirstChild("leaderstats")
    if stats and stats:FindFirstChild("Power") then
        if stats.Power.Value >= HEDEF_DEGER then
            warn("BULDUM! " .. v.Name .. " isimli oyuncuda yüksek değer var: " .. stats.Power.Value)
            bulundu = true
        end
    end
end

if not bulundu then
    wait(3) -- 3 saniye bekle ve yeni sunucuya geç
    ServerHop()
end
