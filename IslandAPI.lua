local API = {};

local MyPlr = game:GetService('Players').LocalPlayer

function API:FindIsland(plrId)
	for i,v in pairs(workspace:GetChildren()) do
		if (v.Name == 'Islands' and v:IsA('Folder')) then 
			if (v:FindFirstChildOfClass('Model').UserId.Value == tonumber(plrId)) then 
			    return v:FindFirstChildOfClass('Model')
			end
		end
	end
end

return API;
