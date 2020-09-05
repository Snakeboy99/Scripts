local MyPlr = game:GetService('Players').LocalPlayer

function FindIsland()
    for i,v in pairs(workspace:GetChildren()) do
        if v.Name == 'Islands' and v:IsA("Folder") then 
            if v:FindFirstChild(tonumber(MyPlr.UserId) .. '-island') then 
                return v:FindFirstChild(tonumber(MyPlr.UserId) .. '-island')
            end
        end
    end
end

GetIsland = FindIsland()
for _,v in pairs(GetIsland.Blocks:GetChildren()) do 
    if v.Name == 'berryBush' and v.stage.Value ~= 1 then 
        game:GetService('Players').LocalPlayer.Character:MoveTo(v.Position)
        game.ReplicatedStorage.Remotes.Functions.CLIENT_HARVEST_CROP_REQUEST:InvokeServer({model = v, player = game:GetService('Players').LocalPlayer})
        wait(.15)
    end
end
