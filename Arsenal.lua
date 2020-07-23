getgenv().Settings = {
	["SpeedValue"] = 22;
}

repeat wait() until game:IsLoaded() 

local Library = loadstring(game:HttpGet"https://fluxteam.xyz/external-files/lib.lua")()

local Window1 = Library:CreateWindow("Arsenal")
 
local CanSpeed = false;
ESPWindow:AddToggle("Speed", function()
	CanSpeed = not CanSpeed
end)

local Functions = {
	["SpeedUpdate"] = nil;
};

for i,v in pairs(getgc(true)) do
    if typeof(v) == "table" and rawget(v,"numero") and rawget(v,"desat") then
        for i2,v2 in pairs(v) do
            if i2 == "speedupdate" and typeof(v2) == "function" then
                Functions.SpeedUpdate = v2;
            end
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
	local Speed = getgenv().Settings.SpeedValue

	if CanSpeed then
		debug.setconstant(Function,52,Speed)
	else
		debug.setconstant(Function,52,22)
	end
end)
