if not game.Loaded then 
	repeat wait() until game:IsLoaded() 
end

local ESP = {};

local Toggle = {
	["VisibilityTracer"] = false;
	["VisibilityBox"] = false;
	["VisibilityTag"] = false;
	["TeamCheck"] = false;
	["Rainbow"] = false;
}

local Library = loadstring(game:HttpGet"https://fluxteam.xyz/external-files/lib.lua")()

local ESPWindow = Library:CreateWindow("ESP")
 
ESPWindow:AddToggle("Tracers", function()
	Toggle.VisibilityTracer = not Toggle.VisibilityTracer
end)

ESPWindow:AddToggle("Box", function()
	Toggle.VisibilityBox = not Toggle.VisibilityBox
end)

ESPWindow:AddToggle("Name Tag", function()
	Toggle.VisibilityTag = not Toggle.VisibilityTag
end)

ESPWindow:AddToggle("Team Check", function()
	Toggle.TeamCheck = not Toggle.TeamCheck
end)

ESPWindow:AddToggle("Rainbow", function()
	Toggle.Rainbow = not Toggle.Rainbow
end)

spawn(function()
	while wait() do
		for i,v in pairs(ESP) do
			if v.Char then
				if v.Tracer and v.BoxESP and v.NameTag and Toggle.TeamCheck and Toggle.Rainbow then
					v.Tracer.Color = Color3.fromRGB(255,255,255)
					v.BoxESP.Color = Color3.fromRGB(255,255,255)
					v.NameTag.Color = Color3.fromRGB(255,255,255)
				else
					if v.Tracer and v.BoxESP and v.NameTag and not Toggle.TeamCheck and not Toggle.Rainbow then
						v.Tracer.Color = Color3.fromRGB(255,255,255)
						v.BoxESP.Color = Color3.fromRGB(255,255,255)
						v.NameTag.Color = Color3.fromRGB(255,255,255)
					else
						if v.Tracer and v.BoxESP and v.NameTag and Toggle.TeamCheck then
							v.Tracer.Color = v.TeamRGB
							v.BoxESP.Color = v.TeamRGB
							v.NameTag.Color = v.TeamRGB
						elseif v.Tracer and v.BoxESP and v.NameTag and Toggle.Rainbow then
							v.Tracer.Color = Color3.fromHSV(tick()%5/5, 1, 1)
							v.BoxESP.Color = Color3.fromHSV(tick()%5/5, 1, 1)
							v.NameTag.Color = Color3.fromHSV(tick()%5/5, 1, 1)
						end
					end
				end
			end
		end
	end
end)

local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;
local currentCamera = workspace.CurrentCamera;
local RunService = game:GetService("RunService");
local WorldToViewportPoint = currentCamera.WorldToViewportPoint;

if not Players.LocalPlayer.Character then
	repeat wait() until LocalPlayer.Character:FindFirstChild("Head") and LocalPlayer.Character:FindFirstChild("Humanoid")
end

function GetView(vector)
    local Position, Screen = workspace.CurrentCamera:WorldToViewportPoint(vector)
    return {Vector2.new(Position.X,Position.Y), Screen, Position.Z}
end

function charRemoving(char)
   for i, v in next, ESP do
       if v.Char == char and v.Tracer ~= nil and v.BoxESP ~= nil and v.NameTag ~= nil then
           v.Tracer:Remove();
           v.BoxESP:Remove();
           v.NameTag:Remove();
           table.remove(ESP, i);
       end;
   end;
end;

function charAdded(plr)
	plr.Character:WaitForChild("Head");
	plr.Character:WaitForChild("HumanoidRootPart");

	local Line = Drawing.new("Line")
	Line.From = Vector2.new(currentCamera.ViewportSize.X / 2, currentCamera.ViewportSize.Y);
	Line.Color = plr.TeamColor.Color or Color3.fromRGB(255,255,255)
	Line.Transparency = .6
	Line.Thickness = 2

	local Square = Drawing.new("Square");
	Square.Color = plr.TeamColor.Color or Color3.fromRGB(255,255,255);
	Square.Thickness = 2;
	Square.Filled = false;
	Square.Transparency = 0.8;

	local text = Drawing.new("Text");
	text.Text = tostring(plr.Name)
    text.Size = 6;
    text.Color = plr.TeamColor.Color or Color3.fromRGB(255,255,255);
    text.Center = true;
    text.Outline = false;

	ESP[#ESP + 1] = {
		player = plr;
		Tracer = Line;
		BoxESP = Square;
		NameTag = text;
		name = plr.Name;
		Char = plr.Character;
		Head = plr.Character.Head;
		TeamRGB = plr.TeamColor.Color or Color3.fromRGB(255,255,255);
	}
end

for i,v in pairs(Players:GetPlayers()) do
	if v ~= Players.LocalPlayer then
		local char = v.Character
		if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Head") then
			char:WaitForChild("Head");
			char:WaitForChild("HumanoidRootPart");

			local Line = Drawing.new("Line")
			Line.From = Vector2.new(currentCamera.ViewportSize.X / 2, currentCamera.ViewportSize.Y);
			Line.Color = v.TeamColor.Color or Color3.fromRGB(255,255,255)
			Line.Transparency = .6
			Line.Thickness = 2

			local Square = Drawing.new("Square");
			Square.Color = v.TeamColor.Color or Color3.fromRGB(255,255,255);
			Square.Thickness = 2;
			Square.Filled = false;
			Square.Transparency = 0.8;

			local text = Drawing.new("Text");
			text.Text = tostring(v.Name)
    		text.Size = 6;
    		text.Color = v.TeamColor.Color or Color3.fromRGB(255,255,255);
    		text.Center = true;
    		text.Outline = false;

			ESP[#ESP + 1] = {
				player = v;
				Tracer = Line;
				BoxESP = Square;
				NameTag = text;
				name = v.Name;
				Char = char;
				Head = v.Character.Head;
				TeamRGB = v.TeamColor.Color or Color3.fromRGB(255,255,255);
			};
		end
		v.CharacterAdded:Connect(function(CharE)
           charAdded(v);
           CharE:FindFirstChild("Humanoid").Died:Connect(function()
       			charRemoving(v)
       			repeat wait() until v.Character and v.Character.HumanoidRootPart
				wait(2)
       			charAdded(v)
    		end);
       	end);
       	v.CharacterRemoving:Connect(charRemoving);
	end
end

local function playerNew(plr)
   plr.CharacterAdded:Connect(function(CharT)
       charAdded(plr);
       CharT:FindFirstChild("Humanoid").Died:Connect(function()
       		charRemoving(plr)
       		repeat wait() until plr.Character and plr.Character.HumanoidRootPart
			wait(2)
       		charAdded(plr)
    	end);
   end);
   plr.CharacterRemoving:Connect(charRemoving);
end;

game.Players.PlayerAdded:Connect(playerNew)

local Render = RunService.Stepped:Connect(function()
	for i,v in pairs(ESP) do
		pcall(function()
		if not v.Char then return end;
			if v.Char and v.Tracer ~= nil and v.BoxESP ~= nil and v.NameTag ~= nil then
				if v.Tracer == nil and v.BoxESP == nil and v.NameTag == nil then
					for i, v in next, ESP do
       					if v.Tracer == nil and v.BoxESP == nil and v.NameTag == nil then
           					v.Tracer:Remove();
           					v.BoxESP:Remove();
           					v.NameTag:Remove();
          				 	table.remove(ESP, i);
       					end;
  					end;
				end

				repeat wait() until v.Char and v.Char.HumanoidRootPart
				if v.Char and v.Tracer and v.BoxESP and v.NameTag and v.name then
					local Point = GetView(v.Char.HumanoidRootPart.Position)
					local headPos = WorldToViewportPoint(currentCamera,v.Char.Head.Position)
					local rootPart,rootVisible = WorldToViewportPoint(currentCamera,v.Char.HumanoidRootPart.Position)
					if rootVisible then
						v.Tracer.To = Point[1]
						v.BoxESP.Size = Vector2.new(1400/rootPart.Z,2682/rootPart.Z)
						v.BoxESP.Position = Vector2.new((rootPart.X) - v.BoxESP.Size.X/2,(rootPart.Y) - v.BoxESP.Size.Y/2)
						v.NameTag.Position = Vector2.new((rootPart.X), (headPos.Y + v.BoxESP.Size.Y/2) - 25)
						v.NameTag.Size = rootPart.X - v.NameTag.Size/2 - 16

						v.Tracer.Visible = Toggle.VisibilityTracer and rootVisible
						v.BoxESP.Visible = Toggle.VisibilityBox and rootVisible
						v.NameTag.Visible = Toggle.VisibilityTag and rootVisible
					else
						v.Tracer.Visible = false
						v.BoxESP.Visible = false
						v.NameTag.Visible = false
					end
 				end
			end
		end)
	end
end)
