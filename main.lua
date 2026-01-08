-- BRAINROT BRING SYSTEM (SPAWN ETKİSİ)
_G.SpawnMod = true

spawn(function()
    while _G.SpawnMod do
        for _, item in pairs(game.Workspace:GetDescendants()) do
            -- Sadece toplanabilir Brainrot eşyalarını hedef alır
            if item:IsA("BasePart") and item:FindFirstChild("TouchInterest") then
                -- Eşyayı senin tam tepene ışınlar
                item.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
            end
        end
        wait(1) -- Çok hızlı yaparsan oyun çökebilir
    end
end)
