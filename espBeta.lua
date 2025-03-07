return function(ativado)
    if ativado then
        local function criar(player)
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local box = Instance.new("BillboardGui")
                box.Adornee = char:FindFirstChild("HumanoidRootPart")
                box.Size = UDim2.new(0, 100, 0, 100)
                box.AlwaysOnTop = true
                box.StudsOffset = Vector3.new(0, 3, 0)
                box.Parent = char

                local q = Instance.new("Frame")
                q.Size = UDim2.new(1, 0, 1, 0)
                q.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                q.BackgroundTransparency = 0.5
                q.Parent = box

                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 0.3, 0)
                label.Position = UDim2.new(0, 0, 1, 0)
                label.BackgroundTransparency = 1
                label.Text = player.Name
                label.TextColor3 = Color3.fromRGB(255, 255, 255)
                label.TextScaled = true
                label.TextStrokeTransparency = 0.8
                label.Parent = box
            end
        end

        for _, p in ipairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer then
                criar(p)
            end
        end

        game.Players.PlayerAdded:Connect(function(p)
            if p ~= game.Players.LocalPlayer then
                criar(p)
            end
        end)

        game.Players.PlayerRemoving:Connect(function(p)
            if p ~= game.Players.LocalPlayer and p.Character then
                local box = p.Character:FindFirstChildOfClass("BillboardGui")
                if box then
                    box:Destroy()
                end
            end
        end)
    else
        for _, p in ipairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer and p.Character then
                local box = p.Character:FindFirstChildOfClass("BillboardGui")
                if box then
                    box:Destroy()
                end
            end
        end
    end
end
