local UI = {}

local DefaultTheme = {
    gameNameTheme = Color3.fromRGB(255, 157, 0),
    buttonColor = Color3.fromRGB(255, 157, 0)
}
local Objects = {}
local Themes = {
    Default = {
        gameNameTheme = Color3.fromRGB(255, 157, 0),
        buttonColor = Color3.fromRGB(255, 157, 0)
    },
    Blue = {
        gameNameTheme = Color3.fromRGB(0, 110, 255),
        buttonColor = Color3.fromRGB(0, 110, 255)
    },
    Green = {
        gameNameTheme = Color3.fromRGB(45, 255, 0),
        buttonColor = Color3.fromRGB(45, 255, 0)
    },
    Teal = {
        gameNameTheme = Color3.fromRGB(0, 251, 255),
        buttonColor = Color3.fromRGB(0, 251, 255)
    },
    Yellow = {
        gameNameTheme = Color3.fromRGB(255, 255, 0),
        buttonColor = Color3.fromRGB(255, 255, 0)
    },
}
local function ApplyFrameResizingLib(scrollingframe)
	local calc = scrollingframe:FindFirstChild("UIGridLayout") or scrollingframe:FindFirstChild("UIListLayout") or nil;
	local function update()
		pcall(function()
			local cS = calc.AbsoluteContentSize
			scrollingframe.CanvasSize = UDim2.new(0,scrollingframe.Size.X,0,cS.Y + 30)
		end)
	end
	calc.Changed:Connect(update)
	update()
end
function UI:Main(uiName, gameName, keyBind, themeName)
    if not themeList then
        themeList = DefaultTheme
    end
	themeList = themeName and Themes[themeName] or Themes.Blue
    local AcentHubOrange = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TabsFrame = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Logo = Instance.new("TextLabel")
    local Promotion = Instance.new("TextLabel")
    local MainTabsFrame = Instance.new("Frame")
    local UIGridLayout = Instance.new("UIGridLayout")
    local RightLine = Instance.new("Frame")
    local LogoLine = Instance.new("Frame")
    local allPages = Instance.new("Folder")
    local Hider = Instance.new("Frame")
    local input = game:GetService("UserInputService")
    
    uiName = uiName or "Acent Hub"
    gameName = gameName or "BasePlate"
    keyBind = keyBind or "RightAlt"

    AcentHubOrange.Name = "Acent Hub"
    AcentHubOrange.Parent = game.CoreGui
    AcentHubOrange.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = AcentHubOrange
    MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    MainFrame.BorderColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Position = UDim2.new(0.29710868, 0, 0.195777357, 0)
    MainFrame.Size = UDim2.new(0, 411, 0, 275)
    MainFrame.AnchorPoint = Vector2.new(.5,.5)
    
    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = MainFrame
    
    TabsFrame.Name = "TabsFrame"
    TabsFrame.Parent = MainFrame
    TabsFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    TabsFrame.BorderColor3 = Color3.fromRGB(195, 195, 195)
    TabsFrame.BorderSizePixel = 0
    TabsFrame.Size = UDim2.new(0, 127, 0, 275)
    
    UICorner_2.CornerRadius = UDim.new(0, 5)
    UICorner_2.Parent = TabsFrame
    
    Logo.Name = "Logo"
    Logo.Parent = TabsFrame
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.Size = UDim2.new(0, 135, 0, 63)
    Logo.Font = Enum.Font.SourceSansBold
    Logo.Text = uiName
    Logo.TextColor3 = Color3.fromRGB(255, 255, 255)
    Logo.TextSize = 20.000
    function UI:DraggingEnabled(frame, parent)

		parent = parent or frame

		local dragging = false
		local dragInput, mousePos, framePos

		frame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				mousePos = input.Position
				framePos = parent.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)

		frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				dragInput = input
			end
		end)

		input.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				local delta = input.Position - mousePos
				parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
			end
		end)
	end
    
    Promotion.Name = "Promotion"
    Promotion.Parent = TabsFrame
    Promotion.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Promotion.BackgroundTransparency = 1.000
    Promotion.Position = UDim2.new(0.0740504861, 0, 0.105316713, 0)
    Promotion.Size = UDim2.new(0, 117, 0, 43)
    Promotion.Font = Enum.Font.SourceSansBold
    Promotion.Text = gameName
    Promotion.TextColor3 = themeList.buttonColor
    Promotion.TextSize = 17.000
	Objects[Promotion] = "TextColor3"
    
    MainTabsFrame.Name = "MainTabsFrame"
    MainTabsFrame.Parent = TabsFrame
    MainTabsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainTabsFrame.BackgroundTransparency = 1.000
    MainTabsFrame.Position = UDim2.new(0, 0, 0.291139245, 0)
    MainTabsFrame.Size = UDim2.new(0, 129, 0, 194)
    
    
    UIGridLayout.Parent = MainTabsFrame
    UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.CellSize = UDim2.new(0, 114, 0, 32)
    
    RightLine.Name = "RightLine"
    RightLine.Parent = MainFrame
    RightLine.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
    RightLine.BorderSizePixel = 0
    RightLine.Position = UDim2.new(0.324087679, 0, 0, 0)
    RightLine.Size = UDim2.new(0, 1, 0, 275)
    
    LogoLine.Name = "Logo Line"
    LogoLine.Parent = MainFrame
    LogoLine.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
    LogoLine.BorderSizePixel = 0
    LogoLine.Position = UDim2.new(0, 0, 0.262658238, 0)
    LogoLine.Size = UDim2.new(0, 133, 0, 1)

    Hider.Name = "Hider"
    Hider.Parent = MainFrame
    Hider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Hider.BorderSizePixel = 0
    Hider.Position = UDim2.new(0.00230946881, 0, 0.0399999991, 0)
    Hider.Size = UDim2.new(0, 405, 0, 0)
    Hider.Visible = false
    Hider.ZIndex = 100

    allPages.Name = "allPages"
    allPages.Parent = MainFrame

    UI:DraggingEnabled(TabsFrame, MainFrame)


    local Visible = true
 
    input.InputBegan:Connect(function(input, gameProcessedEvent)
        if not gameProcessedEvent then
            if input.KeyCode == Enum.KeyCode[keyBind] then
                if Visible then
                    Visible = false
                    Hider.Visible = true
                    RightLine.Visible = false
                    game.TweenService:Create(Hider, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        Size = UDim2.new(0, 405, 0, 265)
                    }):Play()
                    wait(.2)
                    for i, v in pairs(MainFrame:GetChildren()) do
                        if not v:IsA("UICorner") and not v:IsA("Folder") then
                            v.Visible = false
                        end
                        for i, v in pairs(allPages:GetChildren()) do
                            v.Visible = false
                        end
                    end
                    Hider.Visible = false
                    game.TweenService:Create(MainFrame, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        Size = UDim2.new(0,0,0,0)
                    }):Play()
                    wait(.2)
                    MainFrame.Visible = false
                else
                    MainFrame.Visible = true
                    game.TweenService:Create(MainFrame, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        Size = UDim2.new(0, 411, 0, 275)
                    }):Play()
                    wait(.2)
                    Hider.Visible = true
                    for i, v in pairs(MainFrame:GetChildren()) do
                        if not v:IsA("UICorner") and not v:IsA("Folder") then
                            v.Visible = true
                        end
                        for i, v in pairs(allPages:GetChildren()) do
                            v.Visible = true
                        end
                    end
                    game.TweenService:Create(Hider, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        Size = UDim2.new(0, 405, 0, 0)
                    }):Play()
                    Hider.Visible = false
                    RightLine.Visible = true
                    Visible = true
                end
            end
        end
    end)

    local Tabs = {}

    local FirstTab = true

    function Tabs:Tab(tabName)
        local TabButton = Instance.new("TextButton")
        local UICorner_3 = Instance.new("UICorner")
        local Page = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")

        tabName = tabName or "Tab"

        TabButton.Name = "TabButton"
        TabButton.Parent = MainTabsFrame
        TabButton.BackgroundColor3 = themeList.buttonColor
        TabButton.Size = UDim2.new(0, 200, 0, 50)
        TabButton.Font = Enum.Font.SourceSans
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 16.000
        TabButton.Text = tabName
		Objects[TabButton] = "BackgroundColor3"

        UICorner_3.CornerRadius = UDim.new(0, 5)
        UICorner_3.Parent = TabButton

        Page.Name = tabName
        Page.Parent = allPages
        Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Page.BackgroundTransparency = 1.000
        Page.BorderSizePixel = 0
        Page.Position = UDim2.new(0.330900252, 0, 0.0403336957, 0)
        Page.Selectable = false
        Page.Size = UDim2.new(0, 268, 0, 253)
        Page.ScrollBarThickness = 4
        
        UIListLayout.Parent = Page
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 5)

        ApplyFrameResizingLib(Page)

        if FirstTab then
            Page.Visible = true
            TabButton.BackgroundColor3 = themeList.buttonColor
            FirstTab = false
        else
            Page.Visible = false
            TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        end
 
        TabButton.MouseButton1Click:Connect(function()
            for i, v in pairs(allPages:GetChildren()) do
                v.Visible = false
            end
            Page.Visible = true
            for i, v in pairs(MainTabsFrame:GetChildren()) do
                if not v:IsA("UIGridLayout") then
                    v.BackgroundColor3 = Color3.fromRGB(35,35,35)
                end
            end
            game.TweenService:Create(TabButton, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                BackgroundColor3 = themeList.buttonColor
            }):Play()
        end)

        local Section = {}

        function Section:Section()
            local Elements = {}

            function  Elements:Toggle(toggleName, callback)
                local Toggle = Instance.new("Frame")
                local UICorner_7 = Instance.new("UICorner")
                local MainToggle = Instance.new("TextButton")
                local UICorner_8 = Instance.new("UICorner")
                local done = Instance.new("ImageLabel")
                local ToggleText = Instance.new("TextLabel")

                callback = callback or function() end
                toggleName = toggleName or "Toggle"

                Toggle.Name = "Toggle"
                Toggle.Parent = Page
                Toggle.Active = true
                Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                Toggle.Selectable = true
                Toggle.Size = UDim2.new(0, 240, 0, 35)
                
                UICorner_7.CornerRadius = UDim.new(0, 5)
                UICorner_7.Parent = Toggle
                
                MainToggle.Name = "MainToggle"
                MainToggle.Parent = Toggle
                MainToggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                MainToggle.Position = UDim2.new(0.885576844, 0, 0.158333331, 0)
                MainToggle.Size = UDim2.new(0, 19, 0, 19)
                MainToggle.Font = Enum.Font.SourceSans
                MainToggle.Text = ""
                MainToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
                MainToggle.TextSize = 14.000

				local Toggled = false
                MainToggle.MouseButton1Click:Connect(function()
					Toggled = not Toggled
					Objects[MainToggle] = Toggled
					pcall(callback, Toggled)
                    if Toggled then
                        game.TweenService:Create(MainToggle, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = themeList.buttonColor
                        }):Play()
                        done.Visible = true
                        game.TweenService:Create(done, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Size = UDim2.new(0, 19, 0, 19)
                        }):Play()
                    else
                        game.TweenService:Create(MainToggle, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                        }):Play()
                        game.TweenService:Create(done, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Size = UDim2.new(0, 0, 0, 0)
                        }):Play()
                        wait(.2)
                        done.Visible = false
                    end
                    return Toggled
                end)
                UICorner_8.CornerRadius = UDim.new(0, 4)
                UICorner_8.Parent = MainToggle
                
                done.Name = "done"
                done.AnchorPoint = Vector2.new(.5,.5)
                done.Position = UDim2.new(.5,0,.5,0)
                done.Parent = MainToggle
                done.BackgroundTransparency = 1.000
                done.LayoutOrder = 4
                done.Size = UDim2.new(0, 19, 0, 19)
                done.ZIndex = 2
                done.Image = "rbxassetid://3926305904"
                done.ImageRectOffset = Vector2.new(644, 204)
                done.ImageRectSize = Vector2.new(36, 36)
                done.Visible = false
                
                ToggleText.Name = "ToggleText"
                ToggleText.Parent = Toggle
                ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleText.BackgroundTransparency = 1.000
                ToggleText.Position = UDim2.new(0.0384615585, 0, 0, 0)
                ToggleText.Size = UDim2.new(0, 162, 0, 30)
                ToggleText.Font = Enum.Font.SourceSans
                ToggleText.Text = toggleName
                ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
                ToggleText.TextSize = 18.000
                ToggleText.TextXAlignment = Enum.TextXAlignment.Left
            end

            function Elements:DropDown(dropdownName, listOfElements, callback)
                local DropDown = Instance.new("Frame")
                local UICorner_12 = Instance.new("UICorner")
                local ToggleText_2 = Instance.new("TextLabel")
                local Open = Instance.new("ImageButton")
                local Close = Instance.new("ImageButton")
                local DropDownFrame = Instance.new("Frame")
                local UIListLayout_2 = Instance.new("UIListLayout")

                callback = callback or function() end
                listOfElements = listOfElements or {}
                dropdownName = dropdownName or "Drop Down"

                DropDown.Name = "DropDown"
                DropDown.Parent = Page
                DropDown.Active = true
                DropDown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                DropDown.Position = UDim2.new(0.0488721803, 0, 0.581027687, 0)
                DropDown.Selectable = true
                DropDown.Size = UDim2.new(0, 240, 0, 30)
                
                UICorner_12.CornerRadius = UDim.new(0, 5)
                UICorner_12.Parent = DropDown
                
                ToggleText_2.Name = "ToggleText"
                ToggleText_2.Parent = DropDown
                ToggleText_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleText_2.BackgroundTransparency = 1.000
                ToggleText_2.Position = UDim2.new(0.0384615585, 0, 0, 0)
                ToggleText_2.Size = UDim2.new(0, 162, 0, 30)
                ToggleText_2.Font = Enum.Font.SourceSans
                ToggleText_2.Text = dropdownName
                ToggleText_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                ToggleText_2.TextSize = 18.000
                ToggleText_2.TextXAlignment = Enum.TextXAlignment.Left

                local count = 0
                for i, v in pairs(listOfElements) do
                    count = count + 1
                end

                Open.Name = "Open"
                Open.Parent = DropDown
                Open.BackgroundTransparency = 1.000
                Open.Position =  UDim2.new(0, 210, 0, 5)
                Open.Size = UDim2.new(0, 25, 0, 25)
                Open.ZIndex = 2
                Open.Image = "rbxassetid://3926305904"
                Open.ImageRectOffset = Vector2.new(404, 284)
                Open.ImageRectSize = Vector2.new(36, 36)
                Open.MouseButton1Click:Connect(function()
                    local SizeToAdd = 20 * count + 30
                    if count > 5 then
                        for i = 1, count, 1 do
                            SizeToAdd = SizeToAdd + 1
                        end
                    end
                    local DesiredSize = 30 + SizeToAdd
                    game.TweenService:Create(DropDown, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        Size = UDim2.new(0, 240, 0, DesiredSize)
                    }):Play()
                    Open.Visible = false
                    Close.Visible = true
                    wait(.2)
                    for i, v in pairs(DropDownFrame:GetChildren()) do
                        if v:IsA("TextButton") then
                            v.Visible = true
                            game.TweenService:Create(v, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundTransparency = 0,
                                TextTransparency = 0
                            }):Play()
                        end
                    end
                end)

                Close.Name = "Close"
                Close.Parent = DropDown
                Close.BackgroundTransparency = 1.000
                Close.Position =  UDim2.new(0, 210, 0, 5)
                Close.Size = UDim2.new(0, 25, 0, 25)
                Close.Visible = false
                Close.ZIndex = 2
                Close.Image = "rbxassetid://3926305904"
                Close.ImageRectOffset = Vector2.new(164, 284)
                Close.ImageRectSize = Vector2.new(36, 36)
                Close.MouseButton1Click:Connect(function()
                    for i, v in pairs(DropDownFrame:GetChildren()) do
                        if v:IsA("TextButton") then
                            game.TweenService:Create(v, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                BackgroundTransparency = 1,
                                TextTransparency = 1
                            }):Play()
                        end
                    end
                    wait(.2)
                    for i, v in pairs(DropDownFrame:GetChildren()) do
                        if v:IsA("TextButton") then
                            v.Visible = false
                        end
                    end
                    game.TweenService:Create(DropDown, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        Size = UDim2.new(0, 240, 0, 30)
                    }):Play()
                    Open.Visible = true
                    Close.Visible = false
                end)

                DropDownFrame.Name = "DropDownFrame"
                DropDownFrame.Parent = DropDown
                DropDownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropDownFrame.BackgroundTransparency = 1.000
                DropDownFrame.Position = UDim2.new(0, 0, 0, 40)
                DropDownFrame.Size = UDim2.new(0, 240, 0, 20 * count)
                
                UIListLayout_2.Parent = DropDownFrame
                UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_2.Padding = UDim.new(0, 2)
                
                for i = 1, count, 1 do
                    local TextButton_2 = Instance.new("TextButton")
                    local UICorner_13 = Instance.new("UICorner")
                    local id = Instance.new("StringValue")

                    TextButton_2.Parent = DropDownFrame
					TextButton_2.Name = listOfElements[i]
                    id.Name = "ID"
                    id.Parent = TextButton_2
                    id.Value = listOfElements[i]
                    TextButton_2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    TextButton_2.Position = UDim2.new(0.0333333351, 0, 0.427083343, 0)
                    TextButton_2.Size = UDim2.new(0, 223, 0, 20)
                    TextButton_2.Font = Enum.Font.SourceSans
                    TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                    TextButton_2.TextSize = 16.000
                    TextButton_2.Visible = false
                    TextButton_2.Text = listOfElements[i]
					Objects[TextButton_2] = false
                    TextButton_2.MouseButton1Click:Connect(function()
						ChosenDropDown = TextButton_2.ID.Value
						pcall(callback, ChosenDropDown)

                        for i, v in pairs(DropDownFrame:GetChildren()) do
                            if v:IsA("TextButton")then
                                v.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                            end
                        end

                        game.TweenService:Create(TextButton_2, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = themeList.buttonColor
                        }):Play()

                        for i, v in pairs(DropDownFrame:GetChildren()) do
                            if v:IsA("TextButton") then
								Objects[v] = false
                                game.TweenService:Create(v, TweenInfo.new(.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                    BackgroundTransparency = 1,
                                    TextTransparency = 1
                                }):Play()
                            end
                        end	
						Objects[TextButton_2] = true
                        wait(.4)
                        for i, v in pairs(DropDownFrame:GetChildren()) do
                            if v:IsA("TextButton") then
                                v.Visible = false
                            end
                        end	
                        game.TweenService:Create(DropDown, TweenInfo.new(.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Size = UDim2.new(0, 240, 0, 30)
                        }):Play()

                        Open.Visible = true
                        Close.Visible = false
                    end)
                    UICorner_13.CornerRadius = UDim.new(0, 3)
                    UICorner_13.Parent = TextButton_2
                end
                return ChosenDropDown
                
                
            end

            function Elements:Slider(maxvalue, minvalue, sliderName, callback)
                local Slider = Instance.new("Frame")
                local UICorner_9 = Instance.new("UICorner")
                local SliderText = Instance.new("TextLabel")
                local SliderBackground = Instance.new("TextButton")
                local UICorner_10 = Instance.new("UICorner")
                local MainSlider = Instance.new("Frame")
                local UICorner_11 = Instance.new("UICorner")
                local A = Instance.new("TextLabel")

                callback = callback or function() end
                sliderName = sliderName or "Slider"
                Slider.Name = "Slider"
                Slider.Parent = Page
                Slider.Active = true
                Slider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                Slider.Position = UDim2.new(0.0488721803, 0, 0.316205531, 0)
                Slider.Selectable = true
                Slider.Size = UDim2.new(0, 240, 0, 62)
                
                UICorner_9.CornerRadius = UDim.new(0, 5)
                UICorner_9.Parent = Slider
                
                SliderText.Name = "SliderText"
                SliderText.Parent = Slider
                SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderText.BackgroundTransparency = 1.000
                SliderText.Position = UDim2.new(0.0384615585, 0, 0, 0)
                SliderText.Size = UDim2.new(0, 190, 0, 35)
                SliderText.Font = Enum.Font.SourceSans
                SliderText.Text = sliderName
                SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderText.TextSize = 18.000
                SliderText.TextXAlignment = Enum.TextXAlignment.Left
                
                SliderBackground.Name = "SliderBackground"
                SliderBackground.Parent = Slider
                SliderBackground.Active = false
                SliderBackground.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                SliderBackground.Position = UDim2.new(0.0375000015, 0, 0.564516127, 0)
                SliderBackground.Selectable = false
                SliderBackground.Size = UDim2.new(0, 222, 0, 9)
                SliderBackground.Text = ""
                SliderBackground.AutoButtonColor = false
                
                UICorner_10.CornerRadius = UDim.new(0, 5)
                UICorner_10.Parent = SliderBackground
                
                MainSlider.Name = "MainSlider"
                MainSlider.Parent = Slider
                MainSlider.BackgroundColor3 = themeList.buttonColor
                MainSlider.Position = UDim2.new(0.0375000015, 0, 0.564516127, 0)
                MainSlider.Size = UDim2.new(0.5, 0, 0, 9)
				Objects[MainSlider] = "BackgroundColor3"
                
                UICorner_11.CornerRadius = UDim.new(0, 5)
                UICorner_11.Parent = MainSlider
                
                local max = SliderBackground
                local bar = MainSlider
                local player = game:GetService("Players").LocalPlayer
                local mouse = player:GetMouse()
                local uis = game:GetService("UserInputService")
                local val = A
                A.Name = "Value"
                A.Parent = Slider
                A.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                A.BackgroundTransparency = 1.000
                A.Position = UDim2.new(0.82916671, 0, 0, 0)
                A.Size = UDim2.new(0, 41, 0, 20)
                A.Font = Enum.Font.SourceSans
                A.Text = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 222) * bar.AbsoluteSize.X) + tonumber(minvalue)) or 0
                A.TextColor3 = Color3.fromRGB(255, 255, 255)
                A.TextSize = 14.000
                A.TextYAlignment = Enum.TextYAlignment.Bottom
                
                maxvalue = maxvalue or 100
                minvalue = minvalue or 0
                callback = callback or function() end
                max.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 222) * bar.AbsoluteSize.X) + tonumber(minvalue)) or 0
					pcall(callback, Value)
                    bar:TweenSize(UDim2.new(0, math.clamp(mouse.X - bar.AbsolutePosition.X, 0, 222), 0, 9), "InOut", "Linear", 0.05, true)
                    runconnection = game:GetService("RunService").Heartbeat:Connect(function()
                        val.Text = Value
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 222) * bar.AbsoluteSize.X) + tonumber(minvalue))
						pcall(callback, Value)
                        bar:TweenSize(UDim2.new(0, math.clamp(mouse.X - bar.AbsolutePosition.X, 0, 222), 0, 9), "InOut", "Linear", 0.05, true)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 222) * bar.AbsoluteSize.X) + tonumber(minvalue))
							pcall(callback, Value)
                            val.Text = Value
                            bar:TweenSize(UDim2.new(0, math.clamp(mouse.X - bar.AbsolutePosition.X, 0, 222), 0, 9), "InOut", "Linear", 0.05, true)
                            runconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
                return Value
            end

            function Elements:Label(labelText)
                local TextLabel = Instance.new("TextLabel")
                local UICorner_17 = Instance.new("UICorner")

                labelText = labelText or "Label"

                TextLabel.Parent = Page
                TextLabel.Active = true
                TextLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                TextLabel.Position = UDim2.new(0.0522388071, 0, 0.545454562, 0)
                TextLabel.Selectable = true
                TextLabel.Size = UDim2.new(0, 240, 0, 30)
                TextLabel.Font = Enum.Font.SourceSans
                TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel.TextSize = 16.000
                TextLabel.Text = labelText
                
                UICorner_17.CornerRadius = UDim.new(0, 5)
                UICorner_17.Parent = TextLabel
            end

            function Elements:KeyBind(keybindName, lastKeyBind, callback)
                local KeyBind = Instance.new("Frame")
                local UICorner_15 = Instance.new("UICorner")
                local BindText = Instance.new("TextLabel")
                local KeyBind_2 = Instance.new("TextButton")
                local UICorner_16 = Instance.new("UICorner")

                keybindName = keybindName or "Key bind"
                local oldKey = lastKeyBind
                local updatingKeybind = false
                local FirstKeyCode = true
                callback = callback or function () end
                KeyBind.Name = "KeyBind"
                KeyBind.Parent = Page
                KeyBind.Active = true
                KeyBind.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                KeyBind.Selectable = true
                KeyBind.Size = UDim2.new(0, 240, 0, 35)
                
                UICorner_15.CornerRadius = UDim.new(0, 5)
                UICorner_15.Parent = KeyBind
                
                BindText.Name = "BindText"
                BindText.Parent = KeyBind
                BindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                BindText.BackgroundTransparency = 1.000
                BindText.Position = UDim2.new(0.0384615585, 0, 0, 0)
                BindText.Size = UDim2.new(0, 162, 0, 30)
                BindText.Font = Enum.Font.SourceSans
                BindText.Text = keybindName
                BindText.TextColor3 = Color3.fromRGB(255, 255, 255)
                BindText.TextSize = 18.000
                BindText.TextXAlignment = Enum.TextXAlignment.Left
                
                KeyBind_2.Name = "KeyBind"
                KeyBind_2.Parent = KeyBind
                KeyBind_2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                KeyBind_2.Position = UDim2.new(0.829166651, 0, 0.215476334, 0)
                KeyBind_2.Size = UDim2.new(0, 32, 0, 19)
                KeyBind_2.Font = Enum.Font.SourceSans
                KeyBind_2.Text = oldKey
                KeyBind_2.TextColor3 = themeList.buttonColor
                KeyBind_2.TextSize = 16.000
                KeyBind_2.MouseButton1Click:Connect(function(e)
                    FirstKeyCode = false
                    updatingKeybind = true
                    KeyBind_2.Text = "..."
                    local a, b = game:GetService('UserInputService').InputBegan:Wait();
                    KeyBind_2.Text = a.KeyCode.Name ~= "Unknown" and a.KeyCode.Name or a.UserInputType.Name
                    oldKey = a.KeyCode;
                    wait(0.1)
                    updatingKeybind = false
                end)
				Objects[KeyBind_2] = "TextColor3"
                
                input.InputBegan:Connect(function(input, gameProcessedEvent)
                    if not gameProcessedEvent then
                        if FirstKeyCode then
                            if input.KeyCode == Enum.KeyCode[oldKey] then
                                pcall(callback, input.KeyCode)
                            end
                        end
                    end
                end)
                
                game:GetService("UserInputService").InputBegan:Connect(function(current, ok) 
                    if not ok and not updatingKeybind then 
                        if current.KeyCode == oldKey then
                            pcall(callback, current.KeyCode)
                        end
                    end
                    return oldKey
                end)

                UICorner_16.CornerRadius = UDim.new(0, 4)
                UICorner_16.Parent = KeyBind_2
            end

            function Elements:Separate()
                local Seprate = Instance.new("Frame")
                local UICorner_18 = Instance.new("UICorner")

                Seprate.Name = "Seprate"
                Seprate.Parent = Page
                Seprate.Active = true
                Seprate.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                Seprate.Position = UDim2.new(0.0522388071, 0, 0.683794439, 0)
                Seprate.Selectable = true
                Seprate.Size = UDim2.new(0, 240, 0, 15)
                
                UICorner_18.CornerRadius = UDim.new(0, 3)
                UICorner_18.Parent = Seprate
            end

            function Elements:TextBox(textboxName, textboxPlaceHolder, callback)
                local TextBox = Instance.new("Frame")
                local UICorner_19 = Instance.new("UICorner")
                local TextBoxText = Instance.new("TextLabel")
                local TextInput = Instance.new("TextBox")
                local UICorner_20 = Instance.new("UICorner")

                callback = callback or function () end
                textboxName = textboxName or "Text box"
                textboxPlaceHolder = textboxPlaceHolder or "Type!"

                TextBox.Name = "TextBox"
                TextBox.Parent = Page
                TextBox.Active = true
                TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                TextBox.Selectable = true
                TextBox.Size = UDim2.new(0, 240, 0, 35)
                
                UICorner_19.CornerRadius = UDim.new(0, 5)
                UICorner_19.Parent = TextBox
                
                TextBoxText.Name = "TextBoxText"
                TextBoxText.Parent = TextBox
                TextBoxText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBoxText.BackgroundTransparency = 1.000
                TextBoxText.Position = UDim2.new(0.0384615585, 0, 0, 0)
                TextBoxText.Size = UDim2.new(0, 162, 0, 30)
                TextBoxText.Font = Enum.Font.SourceSans
                TextBoxText.Text = textboxName
                TextBoxText.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBoxText.TextSize = 18.000
                TextBoxText.TextXAlignment = Enum.TextXAlignment.Left
                
                TextInput.Name = "TextInput"
                TextInput.Parent = TextBox
                TextInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                TextInput.Position = UDim2.new(0.667628229, 0, 0.18690446, 0)
                TextInput.Size = UDim2.new(0, 70, 0, 20)
                TextInput.Font = Enum.Font.SourceSans
                TextInput.PlaceholderText = textboxPlaceHolder
                TextInput.Text = ""
                TextInput.TextColor3 = themeList.buttonColor
                TextInput.TextSize = 16.000
                TextInput.FocusLost:Connect(function()
                    text = TextInput.Text
                    pcall(callback, TextInput.Text)
                end)
				Objects[TextInput] = "TextColor3"

                UICorner_20.CornerRadius = UDim.new(0, 3)
                UICorner_20.Parent = TextInput
                return text
            end

            function Elements:Button(buttonName, callback)
                local TextButton = Instance.new("TextButton")
                local UICorner_6 = Instance.new("UICorner")

                callback = callback or function() end
                buttonName = buttonName or "Button"

                TextButton.Parent = Page
                TextButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                TextButton.Size = UDim2.new(0, 240, 0, 35)
                TextButton.Font = Enum.Font.SourceSans
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextSize = 16.000
                TextButton.Text = buttonName
                TextButton.MouseButton1Click:Connect(function()
                    pcall(callback)
                end)

                UICorner_6.CornerRadius = UDim.new(0, 5)
                UICorner_6.Parent = TextButton
            end

			function Elements:ThemeChanger()
				local ThemeNames = {}
				for I,V in pairs(Themes) do
					table.insert(ThemeNames, tostring(I))
				end
				Elements:DropDown(
					"Themes",
					ThemeNames,
					function(value)
						themeList = Themes[value]
						for I,V in pairs(Objects) do
							if type(V) == "string" then
								I[V] = themeList.buttonColor
							elseif V then
								I.BackgroundColor3 = themeList.buttonColor
							end
						end
					end
				)
			end
            return Elements
        end
        return Section
    end
    return Tabs
end

function UI:Delete()
    if game.CoreGui:FindFirstChild("Acent Hub") ~= nil then
        game.CoreGui:FindFirstChild("Acent Hub"):Destroy()
    end
end

return UI
