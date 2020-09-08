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

spawn(function()
    while true do
        BlocksFolder = FindIsland().Blocks
        if getgenv().AutoFarmer and BlocksFolder then
            for _,v in pairs(BlocksFolder:GetChildren()) do
               if v.Name == 'berryBush' and v.stage.Value == 2 then
                   if getgenv().AutoFarmer then
                        game:GetService('Players').LocalPlayer.Character:MoveTo(v.Position)
                        game.ReplicatedStorage.Remotes.Functions.CLIENT_HARVEST_CROP_REQUEST:InvokeServer({model = v, player = game:GetService('Players').LocalPlayer})
                        wait(.15)
                   end
               end
            end
        end
        wait(2)
    end
end)
