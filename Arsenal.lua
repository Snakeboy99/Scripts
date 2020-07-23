getgenv().Settings = {
	["SpeedValue"] = 22;
}

repeat wait() until game:IsLoaded() 

local Library = loadstring(game:HttpGet"https://fluxteam.xyz/external-files/lib.lua")()

local Window1 = Library:CreateWindow("Arsenal")
 
local NoShakeCam = false;

Window1:AddToggle("No ShakeCam", function()
	NoShakeCam = not NoShakeCam
end)

local CanSpeed = false;

Window1:AddToggle("Speed", function()
	CanSpeed = not CanSpeed
end)

Window1:AddSlider("Speed",22.6, 100, getgenv().Settings.SpeedValue, function(var)
    getgenv().Settings.SpeedValue = tonumber(var);
end);

local SpeedUpdate;

for i,v in pairs(getgc(true)) do
    if typeof(v) == "table" and rawget(v,"numero") and rawget(v,"desat") then
        for i2,v2 in pairs(v) do
            if i2 == "speedupdate" and typeof(v2) == "function" then
                SpeedUpdate = v2;
            end
        end
    end
end

local ShakeFunc;

for i,v in pairs(getgc(true)) do
    if typeof(v) == "table" and rawget(v,"numero") and rawget(v,"desat") then
        for i2,v2 in pairs(v) do
            if i2 == "ShakeCam" and typeof(v2) == "function" then
                ShakeFunc = v2
            end
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
	pcall(function()
		if CanSpeed then
			debug.setconstant(SpeedUpdate,52,getgenv().Settings.SpeedValue)
		else
			debug.setconstant(SpeedUpdate,52,22)
		end;
	end)
end);

game:GetService("RunService").RenderStepped:Connect(function()
	pcall(function()
		if NoShakeCam then
			debug.setconstant(ShakeFunc,7,0)
    			debug.setconstant(ShakeFunc,16,0)
		end;
	end)
end);
