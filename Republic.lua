local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Main = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local QuickExec = Instance.new("Frame")
local ExecBar = Instance.new("TextBox")
local UICorner_3 = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local Frame_3 = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UICorner_4 = Instance.new("UICorner")
local UIGridLayout = Instance.new("UIGridLayout")
local UICorner_5 = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui.RobloxGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.403862298, 0, 0.342233002, 0)
Frame.Size = UDim2.new(0, 479, 0, 250)

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Frame

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0, 0, 0.104000002, 0)
Frame_2.Size = UDim2.new(0, 479, 0, 1)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 98, 0, 26)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "REPUBLIC"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000

Main.Name = "Main"
Main.Parent = Frame
Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.0250521917, 0, 0.159999996, 0)
Main.Size = UDim2.new(0, 455, 0, 199)

UICorner_2.CornerRadius = UDim.new(0, 6)
UICorner_2.Parent = Main

QuickExec.Name = "QuickExec"
QuickExec.Parent = Main
QuickExec.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
QuickExec.BorderSizePixel = 0
QuickExec.Position = UDim2.new(0.0131868133, 0, 0.0301507544, 0)
QuickExec.Size = UDim2.new(0, 437, 0, 33)

ExecBar.Name = "ExecBar"
ExecBar.Parent = QuickExec
ExecBar.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
ExecBar.BorderSizePixel = 0
ExecBar.Position = UDim2.new(0.0489853919, 0, 0.216842189, 0)
ExecBar.Size = UDim2.new(0, 369, 0, 18)
ExecBar.Font = Enum.Font.SourceSans
ExecBar.PlaceholderText = "Quick Execute (type name of script)"
ExecBar.Text = ""
ExecBar.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecBar.TextSize = 14.000
ExecBar.TextXAlignment = Enum.TextXAlignment.Left

UICorner_3.Parent = QuickExec

ImageLabel.Parent = QuickExec
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.935926795, 0, 0.0909090936, 0)
ImageLabel.Size = UDim2.new(0, 26, 0, 26)
ImageLabel.Image = "rbxassetid://2512702176"

Frame_3.Parent = Main
Frame_3.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.0131868133, 0, 0.246231154, 0)
Frame_3.Size = UDim2.new(0, 435, 0, 136)

ScrollingFrame.Parent = Frame_3
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.0246810745, 0, 0.047701668, 0)
ScrollingFrame.Size = UDim2.new(0, 417, 0, 122)
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255,255,255)

UIGridLayout.Parent = ScrollingFrame
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 62, 0, 62)

UICorner_5.CornerRadius = UDim.new(0, 5)
UICorner_5.Parent = Frame_3

local scripts = {}

function AddScript(name, _callback)
	local ScriptFrame = Instance.new("Frame", ScrollingFrame)
	ScriptFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	ScriptFrame.BorderSizePixel = 0
	ScriptFrame.Position = UDim2.new(0.0394592956, 0, 0.340487093, 0)
	ScriptFrame.Size = UDim2.new(0, 62, 0, 62)
	Instance.new("UICorner", ScriptFrame)
	local LoadScript = Instance.new("TextButton", ScriptFrame)
	LoadScript.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadScript.BackgroundTransparency = 1.000
	LoadScript.BorderSizePixel = 0
	LoadScript.Size = UDim2.new(1, 0, 1, 0)
	LoadScript.Font = Enum.Font.GothamBold
	LoadScript.Text = name
	LoadScript.TextColor3 = Color3.fromRGB(255, 255, 255)
	LoadScript.TextSize = 14.000
	LoadScript.TextWrapped = true
	LoadScript.MouseButton1Click:Connect(_callback)
	table.insert(scripts, #scripts + 1, {
		scriptName = name,
		callback = _callback
	})
end

ExecBar.FocusLost:Connect(function()
	local str = ExecBar.Text
	ExecBar.Text = ""
	for i,v in pairs(scripts) do
		if string.lower(v.scriptName) == string.lower(str) then
			v.callback()
		end
	end
end)

local L_1_ = game:GetService("UserInputService")
function drag(L_2_arg1)
	dragToggle = nil
	local dragSpeed = 0.23
	dragInput = nil
	dragStart = nil
	local dragPos = nil
	function updateInput(L_3_arg1)
		local Delta = L_3_arg1.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(L_2_arg1, TweenInfo.new(0.25), {
			Position = Position
		}):Play()
	end
	L_2_arg1.InputBegan:Connect(function(L_4_arg1)
		if (L_4_arg1.UserInputType == Enum.UserInputType.MouseButton1 or L_4_arg1.UserInputType == Enum.UserInputType.Touch) and L_1_:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = L_4_arg1.Position
			startPos = L_2_arg1.Position
			L_4_arg1.Changed:Connect(function()
				if L_4_arg1.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	L_2_arg1.InputChanged:Connect(function(L_5_arg1)
		if L_5_arg1.UserInputType == Enum.UserInputType.MouseMovement or L_5_arg1.UserInputType == Enum.UserInputType.Touch then
			dragInput = L_5_arg1
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(L_6_arg1)
		if L_6_arg1 == dragInput and dragToggle then
			updateInput(L_6_arg1)
		end
	end)
end
drag(Frame)

AddScript('Infectious Smile', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Alpha-404/Roblox-Scripts/main/Infectious%20Smile.lua'))()
end)

AddScript('Yandre Knife', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Alpha-404/Roblox-Scripts/main/YandreKnife.lua'))()
end)

AddScript('Ragdoll Engine', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Alpha-404/Roblox-Scripts/main/Ragdoll%20Gui.lua'))()
end)

AddScript('Krystal Dance', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Alpha-404/Roblox-Scripts/main/KrystalDance.lua'))()
end)

AddScript('Moneygun Madness', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Alpha-404/Roblox-Scripts/main/MoneygunMadness'))()
end)

AddScript('FE Stand', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Alpha-404/Roblox-Scripts/main/FE%20Stand'))()
end)

AddScript('Point', function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Alpha-404/Roblox-Scripts/main/point.lua'))()
end)

AddScript('Net Bypass', function()
	local sethid = sethiddenproperty or set_hidden_property or set_hidden_prop
	local setsim = setsimulationradius or set_simulation_radius
	local huge = math.huge*math.huge
	game:GetService("RunService"):BindToRenderStep("Network Access", 1, function()
		settings().Physics.AllowSleep = false
		settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		game:GetService("Players").LocalPlayer.ReplicationFocus = workspace
		sethid(game:GetService("Players").LocalPlayer, "MaximumSimulationRadius",huge) 
		sethid(game:GetService("Players").LocalPlayer, "SimulationRadius", huge)
		setsim(huge,huge,huge,huge)
	end)
end)

AddScript('Doll', function()
	local anim_speed = 0.1


	for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
		if v:IsA("Accessory") then
			if v.Handle:FindFirstChild("SpecialMesh") and v.Name ~= "Hyper Realistic Noob Head" then
				v.Handle.SpecialMesh:Destroy()
			elseif v.Handle:FindFirstChild("Mesh") and v.Name ~= "Hyper Realistic Noob Head" then 
				v.Handle.Mesh:Destroy()
			end
			v.Handle.AccessoryWeld:Destroy()
		end
	end

	local p = game:GetService("Players").LocalPlayer
	local c = p.Character

	local Hats = {
		rightarm = c:WaitForChild("Hat1"),
		leftarm = c:WaitForChild("Pal Hair"),
		rightleg = c:WaitForChild("LavanderHair"),
		leftleg = c:WaitForChild("Pink Hair"),
		torso1 = c:WaitForChild("Robloxclassicred"),
		torso2 = c:WaitForChild("Kate Hair"),
		head = c:WaitForChild("Hyper Realistic Noob Head")
	}

	Hats.torso1.Name = "LeftTorso"
	Hats.torso2.Name = "RightTorso"
	Hats.rightarm.Name = "RightArm"
	Hats.leftarm.Name = "LeftArm"
	Hats.leftleg.Name = "LeftLeg"
	Hats.rightleg.Name = "RightLeg"
	Hats.head.Name = "Head "

	function Joint(P1,P2,Pos,Rot)
		local AlignP = Instance.new('AlignPosition', P2);
		AlignP.ApplyAtCenterOfMass = true;
		AlignP.MaxForce = 67752;
		AlignP.MaxVelocity = math.huge/9e110;
		AlignP.ReactionForceEnabled = false;
		AlignP.Responsiveness = 200;
		AlignP.RigidityEnabled = true;
		local AlignO = Instance.new('AlignOrientation', P2);
		AlignO.MaxAngularVelocity = math.huge/9e110;
		AlignO.MaxTorque = 67752;
		AlignO.PrimaryAxisOnly = false;
		AlignO.ReactionTorqueEnabled = false;
		AlignO.Responsiveness = 200;
		AlignO.RigidityEnabled = true;
		local AttA = Instance.new('Attachment',P2);
		local AttB = Instance.new('Attachment',P1);
		AttA.Orientation = Rot
		AttA.Position = Pos
		AlignP.Attachment1 = AttA;
		AlignP.Attachment0 = AttB;
		AlignO.Attachment1 = AttA;
		AlignO.Attachment0 = AttB;
		AttA.Name = "Align" .. P1.Parent.Name
		AttB.Name = "Align" .. P1.Parent.Name
	end
	Joint(Hats.torso1.Handle, c["HumanoidRootPart"], Vector3.new(-0.5, -1, -2), Vector3.new(0,0,0))
	Joint(Hats.torso2.Handle, Hats.torso1.Handle, Vector3.new(1,0,0), Vector3.new(0,0,0))
	Joint(Hats.rightarm.Handle, Hats.torso2.Handle, Vector3.new(1, -1, -0.3), Vector3.new(90,-0,0))
	Joint(Hats.leftarm.Handle, Hats.torso1.Handle, Vector3.new(-1, -1, -0.3), Vector3.new(90, 0, 0))
	Joint(Hats.rightleg.Handle, Hats.torso2.Handle, Vector3.new(0.5, -0.5, 1.5), Vector3.new(40, 30, 0))
	Joint(Hats.leftleg.Handle, Hats.torso1.Handle, Vector3.new(-0.5, -0.5, 1.5), Vector3.new(40, -30, 0))
	Joint(Hats.head.Handle, Hats.torso1.Handle, Vector3.new(0.5, 0, -1.6), Vector3.new(-40, -0, 0))


	local cpos = "Out"
	local spos = 1
	game:GetService("UserInputService").InputBegan:Connect(function(k, gay)
		if gay then return end
		if k.KeyCode == Enum.KeyCode.E then
			if spos == 1 then
				if cpos == "Out" then--dog
					cpos = "In"
					game:GetService("TweenService"):Create(c.HumanoidRootPart.AlignLeftTorso, TweenInfo.new(anim_speed), {['Position'] = Vector3.new(-0.5, -1, -1.5)}):Play()
				else
					cpos = "Out"
					game:GetService("TweenService"):Create(c.HumanoidRootPart.AlignLeftTorso, TweenInfo.new(anim_speed), {['Position'] = Vector3.new(-0.5, -1, -2)}):Play()
				end
			elseif spos == 2 then--69
				if cpos == "Out" then
					cpos = "In" 
					game:GetService("TweenService"):Create(Hats.torso1.Handle["AlignHead "], TweenInfo.new(anim_speed), {['Position'] = Vector3.new(0.5, -0.5, -1.6)}):Play()
				else
					cpos = "Out"
					game:GetService("TweenService"):Create(Hats.torso1.Handle["AlignHead "], TweenInfo.new(anim_speed), {['Position'] = Vector3.new(0.5, -0, -1.6)}):Play()
				end
			elseif spos == 3 then--blow
				if cpos == "Out" then
					cpos = "In" 
					game:GetService("TweenService"):Create(Hats.torso1.Handle["AlignHead "], TweenInfo.new(anim_speed), {['CFrame'] = CFrame.new(0.5, -0.200000003, -1.60000002, 1, 0, -0, 0, 0.258819073, 0.965925813, 0, -0.965925813, 0.258819073)}):Play()
				else
					cpos = "Out"
					game:GetService("TweenService"):Create(Hats.torso1.Handle["AlignHead "], TweenInfo.new(anim_speed), {['CFrame'] = CFrame.new(0.5, 0, -1.5, 1, 0, -0, 0, 0.258819073, 0.965925813, 0, -0.965925813, 0.258819073)}):Play()
				end
			end
		elseif k.KeyCode == Enum.KeyCode.Q then
			if spos == 1 or spos == 5 then--dog or neutural
				spos = 2 --become 69
				c.HumanoidRootPart.AlignLeftTorso.Position = Vector3.new(-0.5, 0.7, -1.5)
				c.HumanoidRootPart.AlignLeftTorso.Rotation = Vector3.new(-90, -0, 0)
				Hats.torso1.Handle["AlignHead "].Rotation = Vector3.new(-90, -0, 0)
				c.LeftTorso.Handle.AlignLeftLeg.CFrame = CFrame.new(-0.5, -0.5, 1.5, 0.866025388, -0.321393818, -0.383022279, 0, 0.766044557, -0.642787635, 0.5, 0.556670427, 0.663414061)
				c.RightTorso.Handle.AlignRightLeg.CFrame = CFrame.new(0.5, -0.5, 1.5, 0.866025388, 0.321393818, 0.383022279, 0, 0.766044557, -0.642787635, -0.5, 0.556670427, 0.663414061)
				c.LeftTorso.Handle.AlignLeftArm.CFrame = CFrame.new(-1, -1, -0.300000012, 1, 0, 0, 0, -4.37113883e-08, -1, 0, 1, -4.37113883e-08)
				c.RightTorso.Handle.AlignRightArm.CFrame = CFrame.new(1, -1, -0.300000012, 1, 0, 0, 0, -4.37113883e-08, -1, 0, 1, -4.37113883e-08)

			elseif spos == 2 then --if 69 then
				spos = 3 --turn into blowj
				c.HumanoidRootPart.AlignLeftTorso.CFrame = CFrame.new(0.5, -2.29999995, -1.79999995, -1, 1.77635684e-15, 8.74227766e-08, -8.21505353e-08, 0.342020154, -0.939692616, -2.99003524e-08, -0.939692616, -0.342020154)
				Hats.torso1.Handle["AlignHead "].CFrame = CFrame.new(0.5, 0, -1.5, 1, 0, -0, 0, 0.258819073, 0.965925813, 0, -0.965925813, 0.258819073)
				c.LeftTorso.Handle.AlignLeftLeg.CFrame = CFrame.new(-0, 1, 1, 1, 0, 0, 0, -4.37113883e-08, 1, 0, -1, -4.37113883e-08)
				c.RightTorso.Handle.AlignRightLeg.CFrame = CFrame.new(0, 1, 1, 0.98480773, 0.173648179, 7.59040297e-09, 0, -4.37113883e-08, 0.99999994, 0.173648179, -0.98480773, -4.30473115e-08)
			elseif spos == 3 then --if blow
				spos = 4 --become neutual
				c.LeftTorso.Handle["AlignHead "].CFrame = CFrame.new(0.5, -0, -1.5, 1, 0, 0, 0, -4.37113883e-08, 1, 0, -1, -4.37113883e-08)
				c.HumanoidRootPart.AlignLeftTorso.CFrame = CFrame.new(-0.5, 2, 0.5, 1, 0, 0, 0, -4.37113883e-08, -1, 0, 1, -4.37113883e-08)
				c.RightTorso.Handle.AlignRightLeg.CFrame = CFrame.new(0.5, -0.600000024, 1.60000002, 0.866025388, 0, 0.5, 0, 1, -0, -0.5, 0, 0.866025388)
				c.LeftTorso.Handle.AlignLeftLeg.CFrame = CFrame.new(-0.600000024, -0.600000024, 1.60000002, 0.866025388, 0, -0.5, 0, 1, 0, 0.5, 0, 0.866025388)
				c.LeftTorso.Handle.AlignLeftArm.CFrame = CFrame.new(-0.200000003, -0.300000012, -0, 0.766044438, 0, 0.642787576, 0, 1, -0, -0.642787576, 0, 0.766044438)
				c.RightTorso.Handle.AlignRightArm.CFrame = CFrame.new(1, -1, -0.5, 1, 0, 0, 0, -4.37113883e-08, -1, 0, 1, -4.37113883e-08)
			elseif spos == 4 then --if neutral
				spos = 1 --become dog
				Hats.torso1.Handle["AlignHead "].Position = Vector3.new(0.5, 0, -1.6)
				Hats.torso1.Handle["AlignHead "].Rotation = Vector3.new(-40, -0, 0)
				c.HumanoidRootPart.AlignLeftTorso.Position = Vector3.new(-0.5, -1, -2)
				c.HumanoidRootPart.AlignLeftTorso.Rotation = Vector3.new(-0, -0, 0)
				c.LeftTorso.Handle.AlignLeftLeg.CFrame = CFrame.new(-0.5, -0.5, 1.5, 0.866025388, -0.321393818, -0.383022279, 0, 0.766044557, -0.642787635, 0.5, 0.556670427, 0.663414061)
				c.RightTorso.Handle.AlignRightLeg.CFrame = CFrame.new(0.5, -0.5, 1.5, 0.866025388, 0.321393818, 0.383022279, 0, 0.766044557, -0.642787635, -0.5, 0.556670427, 0.663414061)
				c.LeftTorso.Handle.AlignLeftArm.CFrame = CFrame.new(-1, -1, -0.300000012, 1, 0, 0, 0, -4.37113883e-08, -1, 0, 1, -4.37113883e-08)
				c.RightTorso.Handle.AlignRightArm.CFrame = CFrame.new(1, -1, -0.300000012, 1, 0, 0, 0, -4.37113883e-08, -1, 0, 1, -4.37113883e-08)
			end
		end
	end)
end)