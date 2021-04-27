 local library = {flags = {}};
local coreGui = game:GetService("CoreGui");

-- WTF
function createTween(Object,setup,settings)
	local style = (settings.Style or Enum.EasingStyle.Sine);
	local direction = (settings.Direction or Enum.EasingDirection.InOut);
	local length = (settings.TIME or 1);
	local repeatcount = (settings.repeatLimit or 0);
	local reverse = (settings.IsReversed or false);
	local dt = (settings.delay or 0);
	
	local tween = TweenInfo.new(
		length, style, direction, repeatcount, reverse, dt
	);
	
	local tweenService = game:GetService("TweenService");
	local Anim = tweenService:Create(Object,tween,setup);
	Anim:Play();
	return Anim;
end;

function library:Create(object, propertiestbl)
	local item = Instance.new(object);
 
    local props = propertiestbl or {};
	for i, prop in next, props do
		if i ~= "Parent" then
			item[i] = prop;we
		end
	end
	item.Parent = props.Parent;
	return item;
	---/// WALLYS Create Function
end

local Is_Ready;
local check = nil

for i,v in pairs(coreGui:GetChildren()) do 
    if (v.Name == "BlueX_Library" and v:IsA("ScreenGui")) then 
        v:Destroy()
        break
    else
        if (v.Name ~= "BlueX_Library") then
            check = "BLUEX-LOADED=NotFound"
        end
        Is_Ready = true
    end
end

repeat wait(1) until check == "BLUEX-LOADED=NotFound" or check ~= nil; 
Is_Ready = false

local BlueX_Library = library:Create("ScreenGui",{
    Name = "BlueX_Library",
    Enabled = true,
    Parent = coreGui,
    ResetOnSpawn = false
});

function library.new(name, settings)
    local UILibraryNAME = name or "UI Library";
    local options = settings or {};
    local UI = {};

    local Main_F = library:Create("Frame",{
        Name = "Main_F";
        Active = true;
        BackgroundColor3 = Color3.fromRGB(30, 27, 27);
        BorderSizePixel = 0;
        Position = UDim2.new(0, 9, 0, 53);
        Size = UDim2.new(0, 218, 0, 358);
        ZIndex = 2;
        Visible = true;
        Parent = BlueX_Library;
    })

    local UICorner_M = library:Create("UICorner",{
        Name = "UICorner";
        CornerRadius = UDim.new(0, 6);
        Parent = Main_F;
    })

    local Title = library:Create("TextLabel",{
        Name = "Title";
        BackgroundColor3 = Color3.fromRGB(255, 255, 255);
        BackgroundTransparency = 1.000;
        BorderSizePixel = 0;
        Size = UDim2.new(0, 218, 0, 28);
        ZIndex = 4;
        Font = Enum.Font.SourceSansSemibold;
        Text = UILibraryNAME;
        TextColor3 = Color3.fromRGB(208, 208, 208);
        TextSize = 24.000;
        TextStrokeColor3 = Color3.fromRGB(109, 109, 109);
        TextXAlignment = Enum.TextXAlignment.Left;
        Visible = true;
        Parent = Main_F;
    });

    local UIPadding_Title = library:Create("UIPadding",{
        PaddingLeft = UDim.new(0, 6);
        Parent = Title;
    })

    local Theme = library:Create("ImageButton",{
        Name = "Theme"
        Parent = Main_F
        BackgroundColor3 = Color3.fromRGB(79, 132, 255)
        BackgroundTransparency = 1.000
        Position = UDim2.new(0.908256888, -48, 0.00238095224, 4)
        Size = UDim2.new(0, 18, 0, 18)
        ZIndex = 5
        Image = "rbxassetid://3926307971"
        ImageRectOffset = Vector2.new(804, 4)
        ImageRectSize = Vector2.new(36, 36)
        ImageTransparency = 0.500
        ScaleType = Enum.ScaleType.Fit
        TileSize = UDim2.new(0, 5, 0, 5)
    })

    local Searchbar = Instance.new("TextBox")
    Searchbar.Name = "Searchbar"
    Searchbar.Parent = Main_F
    Searchbar.AnchorPoint = Vector2.new(0.5, 0)
    Searchbar.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    Searchbar.BackgroundTransparency = 0
    Searchbar.BorderSizePixel = 0
    Searchbar.Position = UDim2.new(0.5, 0, 0, 32)
    Searchbar.Selectable = false
    Searchbar.Size = UDim2.new(0, 206, 0, 26)
    Searchbar.ZIndex = 4
    Searchbar.Font = Enum.Font.SourceSansSemibold
    Searchbar.PlaceholderColor3 = Color3.fromRGB(243, 243, 243)
    Searchbar.PlaceholderText = "Search"
    Searchbar.Text = ""
    Searchbar.TextColor3 = Color3.fromRGB(255, 255, 255)
    Searchbar.TextSize = 18.000
    Searchbar.TextTransparency = 0

    function updateSearch()
        Searchbar.Text = " ";
        Searchbar.Text = "";
        return false;
    end

    local UICorner_Search = Instance.new("UICorner")
    UICorner_Search.CornerRadius = UDim.new(0, 4)
    UICorner_Search.Parent = Searchbar

    local search_Icon = Instance.new("ImageButton")
    search_Icon.Name = "search"
    search_Icon.Parent = Searchbar
    search_Icon.AnchorPoint = Vector2.new(0, 0.5)
    search_Icon.BackgroundTransparency = 1.000
    search_Icon.Position = UDim2.new(0, 2, 0.5, 0)
    search_Icon.Size = UDim2.new(0, 22, 0, 22)
    search_Icon.ZIndex = 4
    search_Icon.Image = "rbxassetid://3926305904"
    search_Icon.ImageRectOffset = Vector2.new(964, 324)
    search_Icon.ImageRectSize = Vector2.new(36, 36)
    search_Icon.ImageTransparency = 0

    local Tab_UI = Instance.new("Frame")
    local UICorner_tabX = Instance.new("UICorner")  

    Tab_UI.Name = "Tab_UI"
    Tab_UI.Parent = Main_F
    Tab_UI.Active = true
    Tab_UI.AnchorPoint = Vector2.new(0.5, 0)
    Tab_UI.BackgroundColor3 = Color3.fromRGB(78, 137, 255)
    Tab_UI.BorderSizePixel = 0
    Tab_UI.ClipsDescendants = true
    Tab_UI.Position = UDim2.new(0.5, 0, 0, 65)
    Tab_UI.Size = UDim2.new(0, 204, 0, 204)
    Tab_UI.ZIndex = 2

    UICorner_tabX.CornerRadius = UDim.new(0, 4)
    UICorner_tabX.Parent = Tab_UI

    local Tabs = Instance.new("Frame")
    local UICorner_Tabs = Instance.new("UICorner")
    local UIPadding_Tabs = Instance.new("UIPadding")
    local UIListLayout_Tabs = Instance.new("UIListLayout")
    Tabs.Name = "Tabs"
    Tabs.Parent = Tab_UI
    Tabs.Active = true
    Tabs.AnchorPoint = Vector2.new(0.5, 0.5)
    Tabs.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0.5, 0, 0.5, 0)
    Tabs.Size = UDim2.new(1, -4, 1, -4)
    Tabs.ZIndex = 4
    
    UICorner_Tabs.CornerRadius = UDim.new(0, 4)
    UICorner_Tabs.Parent = Tabs
        
    UIListLayout_Tabs.Parent = Tabs
    UIListLayout_Tabs.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_Tabs.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_Tabs.Padding = UDim.new(0, 4)
    
    UIPadding_Tabs.Parent = Tabs
    UIPadding_Tabs.PaddingTop = UDim.new(0, 4)

    local InvisiblePanel = Instance.new("Frame")
    local invisborder_panel = Instance.new("Frame")
    local UICorner_panel = Instance.new("UICorner")
    local panel_main = Instance.new("Frame")
    local UICorner_panel2 = Instance.new("UICorner")
    local Exit = Instance.new("TextButton")
    local UICorner_panel3 = Instance.new("UICorner")
    local Minimize = Instance.new("TextButton")
    local UICorner_panel4 = Instance.new("UICorner")
    local UIListLayout_panel = Instance.new("UIListLayout")

    InvisiblePanel.Name = "HIDE_panel"
    InvisiblePanel.Parent = Main_F
    InvisiblePanel.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    InvisiblePanel.BackgroundTransparency = 1.000
    InvisiblePanel.BorderSizePixel = 0
    InvisiblePanel.ClipsDescendants = true
    InvisiblePanel.Position = UDim2.new(1, 4, 0, 0)
    InvisiblePanel.Size = UDim2.new(0, 206, 1, 0)
    
    invisborder_panel.Name = "invisborder_panel"
    invisborder_panel.Parent = InvisiblePanel
    invisborder_panel.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    invisborder_panel.BorderSizePixel = 0
    invisborder_panel.Position = UDim2.new(0, -84, 0, 0)
    invisborder_panel.Size = UDim2.new(0, 80, 0, 46)
    invisborder_panel.ZIndex = 2
    
    UICorner_panel.CornerRadius = UDim.new(0, 4)
    UICorner_panel.Parent = invisborder_panel
    
    panel_main.Name = "panel_Frame"
    panel_main.Parent = invisborder_panel
    panel_main.AnchorPoint = Vector2.new(0.5, 0.5)
    panel_main.BackgroundColor3 = Color3.fromRGB(30, 27, 27)
    panel_main.BorderSizePixel = 0
    panel_main.Position = UDim2.new(0.5, 0, 0.5, 0)
    panel_main.Size = UDim2.new(1, -4, 1, -4)
    panel_main.ZIndex = 2
    
    UICorner_panel2.CornerRadius = UDim.new(0, 4)
    UICorner_panel2.Parent = panel_main
    
    Exit.Name = "Exit"
    Exit.Parent = panel_main
    Exit.AnchorPoint = Vector2.new(0.5, 0)
    Exit.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    Exit.BackgroundTransparency = 1.000
    Exit.Position = UDim2.new(0.5, 0, 0, 4)
    Exit.Size = UDim2.new(0, 68, 0, 15)
    Exit.ZIndex = 2
    Exit.AutoButtonColor = false
    Exit.Font = Enum.Font.SourceSansSemibold
    Exit.Text = "Exit"
    Exit.TextColor3 = Color3.fromRGB(241, 241, 241)
    Exit.TextSize = 16.000
    
    UICorner_panel3.CornerRadius = UDim.new(0, 2)
    UICorner_panel3.Parent = Exit
    
    Minimize.Name = "Minimize"
    Minimize.Parent = panel_main
    Minimize.AnchorPoint = Vector2.new(0.5, 0)
    Minimize.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    Minimize.BackgroundTransparency = 1.000
    Minimize.Position = UDim2.new(0.5, 0, 1, -20)
    Minimize.Size = UDim2.new(0, 68, 0, 15)
    Minimize.ZIndex = 2
    Minimize.AutoButtonColor = false
    Minimize.Selected = true
    Minimize.Font = Enum.Font.SourceSansSemibold
    Minimize.Text = "Minimize"
    Minimize.TextColor3 = Color3.fromRGB(241, 241, 241)
    Minimize.TextSize = 16.000
    
    UICorner_panel4.CornerRadius = UDim.new(0, 2)
    UICorner_panel4.Parent = Minimize
    
    UIListLayout_panel.Parent = panel_main
    UIListLayout_panel.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout_panel.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_panel.VerticalAlignment = Enum.VerticalAlignment.Center
    UIListLayout_panel.Padding = UDim.new(0, 4)

    local ControlPanel = Instance.new("Frame")
    local UICorner_P1 = Instance.new("UICorner")
    local PControl_2 = Instance.new("Frame")
    local UICorner_P2 = Instance.new("UICorner")
    local tabList = Instance.new("TextButton")
    local UICorner_P3 = Instance.new("UICorner")
    local LastTab = Instance.new("TextButton")
    local UICorner_P4 = Instance.new("UICorner")
    local middle_line = Instance.new("Frame")

    ControlPanel.Name = "ControlPanel"
    ControlPanel.Parent = Main_F
    ControlPanel.AnchorPoint = Vector2.new(0.5, 0)
    ControlPanel.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    ControlPanel.Position = UDim2.new(0.5, 0, 0, 274)
    ControlPanel.Size = UDim2.new(0, 204, 0, 28)
    ControlPanel.ZIndex = 6

    UICorner_P1.CornerRadius = UDim.new(0, 2)
    UICorner_P1.Parent = ControlPanel

    PControl_2.Name = "Control_panel"
    PControl_2.Parent = ControlPanel
    PControl_2.AnchorPoint = Vector2.new(0.5, 0.5)
    PControl_2.BackgroundColor3 = Color3.fromRGB(30, 27, 27)
    PControl_2.Position = UDim2.new(0.5, 0, 0.5, 0)
    PControl_2.Size = UDim2.new(1, -4, 1, -4)
    PControl_2.ZIndex = 6

    UICorner_P2.CornerRadius = UDim.new(0, 2)
    UICorner_P2.Parent = PControl_2

    tabList.Name = "tabList"
    tabList.Parent = PControl_2
    tabList.AnchorPoint = Vector2.new(0, 0.5)
    tabList.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    tabList.BackgroundTransparency = 0.500
    tabList.Position = UDim2.new(0, 3, 0.5, 0)
    tabList.Size = UDim2.new(0, 94, 0, 18)
    tabList.ZIndex = 6
    tabList.Font = Enum.Font.SourceSansBold
    tabList.Text = options.TABMENU or "Tab Menu"
    tabList.TextColor3 = Color3.fromRGB(229, 229, 229)
    tabList.TextSize = 16.000

    UICorner_P3.CornerRadius = UDim.new(0, 2)
    UICorner_P3.Parent = tabList

    LastTab.Name = "LastTab"
    LastTab.Parent = PControl_2
    LastTab.AnchorPoint = Vector2.new(0, 0.5)
    LastTab.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    LastTab.BackgroundTransparency = 0.500
    LastTab.Position = UDim2.new(1, -97, 0.5, 0)
    LastTab.Size = UDim2.new(0, 94, 0, 18)
    LastTab.ZIndex = 6
    LastTab.Font = Enum.Font.SourceSansBold
    LastTab.Text = options.LastTab or "LastTab"
    LastTab.TextColor3 = Color3.fromRGB(229, 229, 229)
    LastTab.TextSize = 16.000
    LastTab.TextWrapped = true

    UICorner_P4.CornerRadius = UDim.new(0, 2)
    UICorner_P4.Parent = LastTab

    middle_line.Name = "middle_line"
    middle_line.Parent = PControl_2
    middle_line.AnchorPoint = Vector2.new(0.5, 0.5)
    middle_line.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    middle_line.BorderSizePixel = 0
    middle_line.Position = UDim2.new(0.5, 0, 0.5, 0)
    middle_line.Size = UDim2.new(0, 2, 1, -6)
    middle_line.ZIndex = 6
    
    local tabs = 0;
    local tab = {};

    tab.Button = nil;
    tab.TAB = nil;
    tab.ISMENU = true;

    local letterCount = tonumber(string.len("Container_"))

    function UI:make_tab(name,vis)
        local tab_Section = {}
        local tabName = name or "unnamed tab"
        tabName = tostring(tabName)

        local ContainerC = Instance.new("ScrollingFrame")
        local UICornerC = Instance.new("UICorner")
        local UIListLayoutC = Instance.new("UIListLayout")

        ContainerC.Name = "Container_" .. tabName
        ContainerC.Parent = Tab_UI
        ContainerC.Active = true
        ContainerC.AnchorPoint = Vector2.new(0.5, 0.5)
        ContainerC.BackgroundColor3 = Color3.fromRGB(30, 27, 27)
        ContainerC.BorderSizePixel = 0
        ContainerC.Position = UDim2.new(0.5, 0, 0.5, 0)
        ContainerC.Size = UDim2.new(1, -4, 1, -4)
        ContainerC.ZIndex = 6
        ContainerC.CanvasSize = UDim2.new(0, 0, 4, 100)
        ContainerC.ScrollBarThickness = 0
        ContainerC.VerticalScrollBarInset = Enum.ScrollBarInset.Always
        ContainerC.Visible = false

        UICornerC.CornerRadius = UDim.new(0, 4)
        UICornerC.Parent = ContainerC

        UIListLayoutC.Parent = ContainerC
        UIListLayoutC.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayoutC.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayoutC.Padding = UDim.new(0, 4)

        local Tab_button = Instance.new("TextButton")
        local UICorner_tab = Instance.new("UICorner")
        local name_tab = Instance.new("TextLabel")
        local UICorner_tab2 = Instance.new("UICorner")

        Tab_button.Name = tabName 
        Tab_button.Parent = Tabs
        Tab_button.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
        Tab_button.Position = UDim2.new(1, -28, 0, 5)
        Tab_button.Size = UDim2.new(1, -8, 0, 24)
        Tab_button.ZIndex = 4
        Tab_button.AutoButtonColor = false
        Tab_button.Font = Enum.Font.SourceSansLight
        Tab_button.Text = ""
        Tab_button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab_button.TextSize = 22.000
        Tab_button.TextStrokeColor3 = Color3.fromRGB(176, 176, 176)
        Tab_button.TextStrokeTransparency = 0.500
        
        UICorner_tab.CornerRadius = UDim.new(0, 2)
        UICorner_tab.Parent = Tab_button
        
        name_tab.Name = 'Name_Tab'
        name_tab.Parent = Tab_button
        name_tab.AnchorPoint = Vector2.new(0.5, 0.5)
        name_tab.BackgroundColor3 = (vis and Color3.fromRGB(79, 132, 255)) or Color3.fromRGB(40, 40, 40)
        name_tab.BorderSizePixel = 0
        name_tab.Position = UDim2.new(0.5, 0, 0.5, 0)
        name_tab.Size = UDim2.new(1, -4, 1, -4)
        name_tab.ZIndex = 5
        name_tab.Font = Enum.Font.SourceSansSemibold
        name_tab.LineHeight = 1.100
        name_tab.Text = tabName
        name_tab.TextColor3 = Color3.fromRGB(240, 240, 240)
        name_tab.TextSize = 18.000
        
        UICorner_tab2.CornerRadius = UDim.new(0, 2)
        UICorner_tab2.Parent = name_tab

        if vis then 
            tab.Button = name_tab;
            tab.Tab = ContainerC;
        end

        Tab_button.MouseButton1Click:Connect(function()
            if tab.Button and tab.TAB then 
                tab.Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                tab.TAB.Visible = false;
            end

            name_tab.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
            ContainerC.Visible = true
            tab.Button = name_tab
            tab.TAB = ContainerC;

            Tabs.Visible = false;
            tab.ISMENU = false;

            updateSearch()
        end)

        local layoutorder = 2
        function tab_Section:addSection(section_Name)
            local Elements = {}
            layoutorder = layoutorder + 1

            local SectionTitle = Instance.new("TextLabel")
            local UIPaddingS = Instance.new("UIPadding")

            SectionTitle.Name = "SectionTitle"
            SectionTitle.Parent = ContainerC
            SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionTitle.BackgroundTransparency = 1.000
            SectionTitle.BorderSizePixel = 0
            SectionTitle.Size = UDim2.new(0, 200, 0, 20)
            SectionTitle.ZIndex = 7
            SectionTitle.Font = Enum.Font.SourceSans
            SectionTitle.Text = section_Name
            SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            SectionTitle.TextSize = 18.000
            SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
            SectionTitle.LayoutOrder = layoutorder

            UIPaddingS.Parent = SectionTitle
            UIPaddingS.PaddingLeft = UDim.new(0, 6)

            function Elements:AddToggle(name,default,callback)
                layoutorder = layoutorder + 1
                local TOGName = name or "unnamed toggle";
                local def = default or false;

                local Toggle_Element = Instance.new("Frame")
                local tname = Instance.new("TextLabel")
                local UIPaddingTog = Instance.new("UIPadding")
                local UICornerTog1 = Instance.new("UICorner")
                local CircleBound = Instance.new("Frame")
                local UICornerTog2 = Instance.new("UICorner")
                local ToggleStatus = Instance.new("TextButton")
                local UICornerTog3 = Instance.new("UICorner")

                Toggle_Element.Name = "Toggle_Element"
                Toggle_Element.Parent = ContainerC
                Toggle_Element.BackgroundColor3 = Color3.fromRGB(55, 80, 141)
                Toggle_Element.BorderSizePixel = 0
                Toggle_Element.Size = UDim2.new(1, -12, 0, 32)
                Toggle_Element.ZIndex = 7
                Toggle_Element.LayoutOrder = layoutorder
    
                tname.Name = "tname"
                tname.Parent = Toggle_Element
                tname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                tname.BackgroundTransparency = 1.000
                tname.BorderSizePixel = 0
                tname.Size = UDim2.new(1, 0, 1, 0)
                tname.ZIndex = 8
                tname.Font = Enum.Font.SourceSansBold
                tname.Text = TOGName
                tname.TextColor3 = Color3.fromRGB(255, 255, 255)
                tname.TextSize = 16.000
                tname.TextXAlignment = Enum.TextXAlignment.Left
    
                UIPaddingTog.Parent = tname
                UIPaddingTog.PaddingLeft = UDim.new(0, 8)
    
                UICornerTog1.CornerRadius = UDim.new(0, 4)
                UICornerTog1.Parent = Toggle_Element
    
                CircleBound.Name = "CircleBound"
                CircleBound.Parent = Toggle_Element
                CircleBound.AnchorPoint = Vector2.new(0, 0.5)
                CircleBound.BackgroundColor3 = Color3.fromRGB(45, 66, 116)
                CircleBound.Position = UDim2.new(1, -68, 0.5, 0)
                CircleBound.Size = UDim2.new(0, 64, 0, 24)
                CircleBound.ZIndex = 8
    
                UICornerTog2.CornerRadius = UDim.new(0, 4)
                UICornerTog2.Parent = CircleBound
    
                ToggleStatus.Name = "ToggleStatus"
                ToggleStatus.Parent = CircleBound
                ToggleStatus.AnchorPoint = Vector2.new(0, 0.5)
                ToggleStatus.BackgroundColor3 = Color3.fromRGB(63, 92, 162)
                ToggleStatus.BorderSizePixel = 0
                ToggleStatus.Position = UDim2.new(0, 3, 0.5, 0)
                ToggleStatus.Size = UDim2.new(0, 32, 1, -6)
                ToggleStatus.ZIndex = 8
                ToggleStatus.AutoButtonColor = false
                ToggleStatus.Font = Enum.Font.SourceSans
                ToggleStatus.Text = "OFF"
                ToggleStatus.TextColor3 = Color3.fromRGB(175, 175, 175)
                ToggleStatus.TextSize = 14.000
    
                UICornerTog3.CornerRadius = UDim.new(0, 4)
                UICornerTog3.Parent = ToggleStatus
                
                ToggleStatus.MouseButton1Click:Connect(function()
                    def = not def;
                    
                    ToggleStatus.Text = (def and "") or "OFF"
                    createTween(ToggleStatus,{Position = (def and UDim2.new(1, -35,0.5, 0)) or UDim2.new(0, 3,0.5, 0)}, {
                        Style = Enum.EasingStyle.Linear,
                        Direction = Enum.EasingDirection.In,
                        TIME = .12
                    });
                    createTween(ToggleStatus,{BackgroundColor3 = (def and Color3.fromRGB(79, 132, 255)) or Color3.fromRGB(63, 92, 162)}, {
                        Style = Enum.EasingStyle.Linear,
                        Direction = Enum.EasingDirection.In,
                        TIME = .12
                    });

                    library.flags[TOGName] = def
                    callback(def)
                end)
            end
            return Elements;
        end
        return tab_Section;
    end

    tabList.MouseButton1Click:Connect(function()
        tab.ISMENU = true;

        Tabs.Visible = true;

        local tabUIChildren = Tab_UI:GetChildren()
        for i,v in pairs(tabUIChildren) do
            if string.sub(v.Name,1,letterCount) == "Container_" and (v.Visible == true) then 
                v.Visible = false;
            end
        end

        updateSearch()
    end)

    library.FUNC = {};
    function library.FUNC:checkTab()
        if tab.Button then 
            tab.Button.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
        end

        local oldName = UILibraryNAME
        repeat wait(.5)
            Title.Text = "Last Tab."
            wait(.15)
            Title.Text = "Last Tab.."
            wait(.15)
            Title.Text = "Last Tab..."
        until Title.Text ~= oldName;

        local tabMenus = tab.TAB;
        Title.Text = oldName;
        tabMenus.Visible = true;
        Tabs.Visible = false;
        return wait;
    end

    spawn(function()
        repeat wait(1) until tab.Tab ~= nil;

        updateSearch()

        LastTab.MouseButton1Click:Connect(function()
            if tab.ISMENU == false then return end;
            library.FUNC:checkTab()(1)
        end)
    end)

    local Settings = Instance.new("ImageButton")
    Settings.Name = "Settings"
    Settings.Parent = Main_F
    Settings.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    Settings.BackgroundTransparency = 1.000
    Settings.Position = UDim2.new(1.02752292, -48, 0.00238095224, 4)
    Settings.Size = UDim2.new(0, 18, 0, 18)
    Settings.ZIndex = 5
    Settings.Image = "rbxassetid://3926307971"
    Settings.ImageRectOffset = Vector2.new(964, 4)
    Settings.ImageRectSize = Vector2.new(36, 36)
    Settings.ImageTransparency = 0.500
    Settings.ScaleType = Enum.ScaleType.Fit
    Settings.TileSize = UDim2.new(0, 5, 0, 5)

    local UI_panel = Instance.new("ImageButton")
    local UICorner_PanelX = Instance.new("UICorner")
    UI_panel.Name = "UI_panel"
    UI_panel.Parent = Main_F
    UI_panel.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    UI_panel.BackgroundTransparency = 1.000
    UI_panel.Position = UDim2.new(1, -18, 0, 4)
    UI_panel.Size = UDim2.new(0, 12, 0, 22)
    UI_panel.ZIndex = 5
    UI_panel.Image = "rbxassetid://3926305904"
    UI_panel.ImageRectOffset = Vector2.new(764, 764)
    UI_panel.ImageRectSize = Vector2.new(36, 36)
    UI_panel.ScaleType = Enum.ScaleType.Crop
    
    UICorner_PanelX.CornerRadius = UDim.new(0, 2)
    UICorner_PanelX.Parent = UI_panel

    local GlobalUpdate = Instance.new("TextLabel")
    local Reopen = Instance.new("TextButton")
    local UICornerReopen = Instance.new("UICorner")
    local Creator = Instance.new("TextLabel")
    GlobalUpdate.Name = "GlobalUpdate"
    GlobalUpdate.Parent = Main_F
    GlobalUpdate.AnchorPoint = Vector2.new(0.5, 0)
    GlobalUpdate.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    GlobalUpdate.BackgroundTransparency = 1.000
    GlobalUpdate.Position = UDim2.new(0.5, 0, 1, -27)
    GlobalUpdate.Size = UDim2.new(1, -20, 0, 24)
    GlobalUpdate.ZIndex = 6
    GlobalUpdate.Font = Enum.Font.SourceSansBold
    GlobalUpdate.Text = options.Label1 or "Updated: 04/20/2021"
    GlobalUpdate.TextColor3 = Color3.fromRGB(217, 222, 232)
    GlobalUpdate.TextSize = 18.000

    Reopen.Name = "Reopen"
    Reopen.Parent = Main_F
    Reopen.AnchorPoint = Vector2.new(0.5, 0)
    Reopen.BackgroundColor3 = Color3.fromRGB(79, 132, 255)
    Reopen.BackgroundTransparency = 1.000
    Reopen.Position = UDim2.new(1, -40, 0, 6)
    Reopen.Size = UDim2.new(0, 68, 0, 18)
    Reopen.ZIndex = 2
    Reopen.AutoButtonColor = false
    Reopen.Selected = true
    Reopen.Font = Enum.Font.SourceSansSemibold
    Reopen.Text =  "Open UI"
    Reopen.TextColor3 = Color3.fromRGB(241, 241, 241)
    Reopen.TextSize = 16.000
    Reopen.TextTransparency = 1.000

    UICornerReopen.CornerRadius = UDim.new(0, 2)
    UICornerReopen.Parent = Reopen

    Creator.Name = "Creator"
    Creator.Parent = Main_F
    Creator.AnchorPoint = Vector2.new(0.5, 0)
    Creator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Creator.BackgroundTransparency = 1.000
    Creator.Position = UDim2.new(0.5, 0, 1, -53)
    Creator.Size = UDim2.new(1, -20, 0, 24)
    Creator.ZIndex = 6
    Creator.Font = Enum.Font.SourceSansBold
    Creator.Text = options.Label2 or "Creator | YoungStar#7248"
    Creator.TextColor3 = Color3.fromRGB(217, 222, 232)
    Creator.TextSize = 18.00

    -- // Closing & Exiting // -- 
    UI_panel.MouseButton1Click:Connect(function()
        BlueX_Library:Destroy()
    end)

    Searchbar:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = Searchbar.Text

        if searchText:len() >= 1 then 
            if tab.ISMENU then 
                for _,tab in next, Tabs:GetChildren() do 
                    if (not tab:IsA("UICorner") and not tab:IsA("UIPadding") and not tab:IsA("UIListLayout")) then 

                        if string.sub(string.lower(tab.Name),1,searchText:len()) == string.sub(string.lower(searchText),1,tab.Name:len()) then 
                            tab.Visible = true;
                        else
                            tab.Visible = false
                        end
                    end
                end
            elseif (not tab.ISMENU) then 
                for _,instances in next, tab.TAB:GetChildren() do 
                    if (not instances:IsA("UICorner") and not instances:IsA("UIPadding") and not instances:IsA("UIListLayout") and instances.Name ~= "SectionTitle") then
                        
                        local NAMETAG = instances:FindFirstChild("tname") or instances:WaitForChild("tname");
                        NAMETAG = NAMETAG.Text
                        if string.sub(string.lower(NAMETAG),1,searchText:len()) == string.sub(string.lower(searchText),1,NAMETAG:len()) then 
                            instances.Visible = true;
                        else
                            instances.Visible = false
                        end
                    end
                end
            end
        else
            Searchbar.Text = ""
            if Searchbar.Text:len() == 0 then 
                if (tab.ISMENU) then 
                    for _,tab in next, Tabs:GetChildren() do 
                        if (not tab:IsA("UICorner") and not tab:IsA("UIPadding") and not tab:IsA("UIListLayout")) then 
                            tab.Visible = true;
                        end
                    end
                elseif (not tab.ISMENU) then
                    for _,instances in next, tab.TAB:GetChildren() do 
                        if (not instances:IsA("UICorner") and not instances:IsA("UIPadding") and not instances:IsA("UIListLayout")) then 
                            instances.Visible = true;
                        end
                    end
                end
            end
        end
    end)

    return UI; 
end

return library;
