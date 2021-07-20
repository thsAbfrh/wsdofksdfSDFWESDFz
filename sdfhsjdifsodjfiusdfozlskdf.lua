---@diagnostic disable: undefined-global, lowercase-global, undefined-field

repeat wait(1 / 60) until game:IsLoaded()
if not isfile("DWPrefix.lua") then
	writefile("DWPrefix.lua", "/")
end
local success, response = pcall(function()
local Admin = {
	Prefix = readfile("DWPrefix.lua"),
	Name = "hash private admin | dev build",
	Version = "v1.8"
}
local Notify = function(Text,Duration)

	local CoreGui = game:GetService("CoreGui")
	local Notifygui = Instance.new("ScreenGui")
	local holder = Instance.new("Frame")
	local mainframe = Instance.new("Frame")
	local title = Instance.new("TextLabel")
	local notifText = Instance.new("TextLabel")
    local ScreenSize = workspace.Camera.ViewportSize

	Notifygui['Name'] = "Notifygui"
	Notifygui['Parent'] = game.CoreGui
	Notifygui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	holder['Name'] = "holder"
	holder['Parent'] = Notifygui
    holder['AnchorPoint'] = Vector2.new(0.5,0,0.5,0)
	holder['BackgroundColor3'] = Color3.fromRGB(223, 223, 223)
	holder['BackgroundTransparency'] = 1
	holder['BorderSizePixel'] = 0
	holder['Position'] = UDim2.new(0.5,0,-0.5,0)
	holder['Size'] = UDim2.new(0, 5, 0, ScreenSize.Y/8.5)
	holder['ClipsDescendants'] = true

	mainframe['Name'] = "mainframe"
	mainframe['Parent'] = holder
	mainframe['BackgroundColor3'] = Color3.fromRGB(25, 25, 25)
	mainframe['BorderSizePixel'] = 0
	mainframe.ClipsDescendants = true
	mainframe['Size'] = UDim2.new(0, ScreenSize.X/3.5, 0, ScreenSize.Y/8.5)
	
	uic = Instance.new('UICorner',mainframe)

	title['Name'] = "title"
	title['Parent'] = mainframe
	title['BackgroundColor3'] = Color3.fromRGB(255,255,255)
	title['BackgroundTransparency'] = 1.000
	title['BorderSizePixel'] = 0
	title['Position'] = UDim2.new(0,0,-0.3,0)
	title['Size'] = UDim2.new(0, ScreenSize.X/3.5, 0, ScreenSize.Y/8.5)
	title['Font'] = Enum['Font'].GothamSemibold
	title.Text = "Hash Admin"
	title.TextColor3 = Color3.fromRGB(255,255,255)
	title.TextSize = 25.000
	title.TextXAlignment = Enum.TextXAlignment.Center

	notifText['Name'] = "notifText"
	notifText['Parent'] = mainframe
	notifText['BackgroundColor3'] = Color3.fromRGB(255,255,255)
	notifText['BackgroundTransparency'] = 1.000
	notifText['BorderSizePixel'] = 0
	notifText['Position'] = UDim2.new(0,0,0.1,0)
	notifText['Size'] = UDim2.new(0, ScreenSize.X/3.5, 0, ScreenSize.Y/8.5)
	notifText['Font'] = Enum['Font'].Gotham
	notifText.Text = Text
	notifText.TextColor3 = Color3.fromRGB(255,255,255)
	notifText.TextSize = 15.000
	notifText.TextXAlignment = Enum.TextXAlignment.Center
	notifText.TextWrapped = true

	

	Duration = Duration or 4
	coroutine.wrap(function()
    holder:TweenPosition(UDim2.new(0.5,0,0,0), "Out", "Quint", .8, true)
    wait(.5)
    holder:TweenSize(UDim2.new(0, ScreenSize.X/3.5, 0, ScreenSize.Y/8.5), "Out", "Quint", .8, true)  
	wait(Duration)
    holder:TweenSize(UDim2.new(0, 5, 0, ScreenSize.Y/8.5), "Out", "Quint", .8, true)
    wait(.5)
	holder:TweenPosition(UDim2.new(0.5,0,-0.5,0), "In", "Quint", .8, true)
    wait(.8)
	Notifygui:Destroy()
	end)()
end
Notify([[
			Loaded
			Version: ]]..Admin.Version,4)
--//////////////////////////////////////////////////////////////////////////////////////////////////////
--//////////////////////////////////////////////////////////////////////////////////////////////////////
--Command bar
local ScreenSize = workspace.Camera.ViewportSize
Be = Instance.new('BlurEffect')
Be.Parent = game.Lighting
Be.Enabled = false
gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false
gui.Name = "Command Bar"
Main = Instance.new("Frame", gui)
Main.BackgroundTransparency = 1
Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0.5,0,0.8,0)
Main.Position = UDim2.new(0.5,0,0.8,0)
Main.Size = UDim2.new(0, 0, 0, ScreenSize.Y/16)
Exec = Instance.new("TextBox", Main)
Exec.BackgroundTransparency = 0.4
Exec.BorderSizePixel = 0
Exec.BackgroundColor3 = Color3.new(0, 0, 0)
Exec.BorderColor3 = Color3.new(0, 0, 127)
Exec.Name = "Execute"
Exec.AnchorPoint = Vector2.new(0.5,0,0.8,0)
Exec.Size = UDim2.new(0, 0, 0, ScreenSize.Y/16)
Exec.Font = "Legacy"
Exec.TextSize = 14
Exec.Text = ""
Exec.TextColor3 = Color3.new(255, 255, 255)
Exec.TextStrokeColor3 = Color3.new(0, 0, 127)
Exec.TextStrokeTransparency = 1
Exec.TextWrapped = true
Exec.FocusLost:connect(function(enterPressed)
	Exec.Text = ""
	Exec:TweenSize(UDim2.new(0, 0, 0, ScreenSize.Y/16), Enum.EasingDirection.In, Enum.EasingStyle.Linear, .05)
	wait(.05)
	Be.Enabled = false
end)
function onKeyPress(actionName, userInputState, inputObject)
	Exec:TweenSize(UDim2.new(0, ScreenSize.X/8, 0, ScreenSize.Y/16), Enum.EasingDirection.In, Enum.EasingStyle.Linear, .05)
	wait(.05)
	Be.Enabled = true
	Exec.Text = ""
	Exec:CaptureFocus()
end
game.ContextActionService:BindAction("keyPress", onKeyPress, false, Enum.KeyCode.Semicolon)


function DeltaWait(n)
    local now = tick()
    n = n or 0
    repeat game:GetService("RunService").Heartbeat:Wait()
    until tick()-now >= n
    return tick()-now
end

--Find player function
function findplr(args)
	if args == "me" then
		return LocalPlayer
	elseif args == "random" then 
		return game:GetService("Players"):GetPlayers()[math.random(1, #game:GetService("Players"):GetPlayers())]
	elseif args == "new" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.AccountAge < 30 and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "old" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.AccountAge > 30 and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "bacon" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Character:FindFirstChild("Pal Hair") or v.Character:FindFirstChild("Kate Hair") and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "friend" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v:IsFriendsWith(LocalPlayer.UserId) and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "notfriend" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if not v:IsFriendsWith(LocalPlayer.UserId) and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "ally" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Team == LocalPlayer.Team and v ~= LocalPlayer then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "enemy" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v.Team ~= LocalPlayer.Team then
				vAges[#vAges + 1] = v
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "near" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v ~= LocalPlayer then
				local math = (v.Character:FindFirstChild("HumanoidRootPart").Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
				if math < 30 then
					vAges[#vAges + 1] = v
				end
			end
		end
		return vAges[math.random(1, #vAges)]
	elseif args == "far" then
		local vAges = {} 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v ~= LocalPlayer then
				local math = (v.Character:FindFirstChild("HumanoidRootPart").Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
				if math > 30 then
					vAges[#vAges + 1] = v
				end
			end
		end
		return vAges[math.random(1, #vAges)]
	else 
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if string.find(string.lower(v.Name), string.lower(args)) then
				return 
			end
		end
	end
end
--script begins here
local mt = getrawmetatable(game)
local LocalPlayer = game.Players.LocalPlayer
local Character = game.Players.LocalPlayer.Character
local Workspace = game:GetService("Workspace")
local Commands = {}

local Chat = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
local hum = game.Players.LocalPlayer.Character
local p = game:GetService("Players").LocalPlayer


--// functions


-- FLY SCRIPT BY RGEENEUS

-- The following code should be in a local script.
-- Only works on PC, not xbox or mobile. I do not have devices to test on.
-- Call the start fly function AFTER the character exists to fly. The function does not run if there is no character.

local speed = 50 -- This is the fly speed. Change it to whatever you like. The variable can be changed while running

local c
local h
local bv
local bav
local cam
local flying
local p = game.Players.LocalPlayer
local buttons = {
	W = false,
	S = false,
	A = false,
	D = false,
	Moving = false
}

local yesfly = function () -- Call this function to begin flying
	if not p.Character or not p.Character.Head or flying then
		return
	end
	
	c = p.Character
	h = c.Humanoid
	h.PlatformStand = true
	cam = workspace:WaitForChild('Camera')
	bv = Instance.new("BodyVelocity")
	bav = Instance.new("BodyAngularVelocity")
	bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
	bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
	bv.Parent = c.Head
	bav.Parent = c.Head
	flying = true
	h.Died:connect(function()
		flying = false
	end)
end

local nofly = function () -- Call this function to stop flying
	if not p.Character or not flying then
		return
	end
	h.PlatformStand = false
	bv:Destroy()
	bav:Destroy()
	flying = false
end

game:GetService("UserInputService").InputBegan:connect(function (input, GPE)
	if GPE then
		return
	end
	for i, e in pairs(buttons) do
		if i ~= "Moving" and input.KeyCode == Enum.KeyCode[i] then
			buttons[i] = true
			buttons.Moving = true
		end
	end
end)

game:GetService("UserInputService").InputEnded:connect(function (input, GPE)
	if GPE then
		return
	end
	local a = false
	for i, e in pairs(buttons) do
		if i ~= "Moving" then
			if input.KeyCode == Enum.KeyCode[i] then
				buttons[i] = false
			end
			if buttons[i] then
				a = true
			end
		end
	end
	buttons.Moving = a
end)

local setVec = function (vec)
	return vec * (speed / vec.Magnitude)
end

game:GetService("RunService").Heartbeat:connect(function (step) -- The actual fly function, called every frame
	if flying and c and c.PrimaryPart then
		local p = c.PrimaryPart.Position
		local cf = cam.CFrame
		local ax, ay, az = cf:toEulerAnglesXYZ()
		c:SetPrimaryPartCFrame(CFrame.new(p.x, p.y, p.z) * CFrame.Angles(ax, ay, az))
		if buttons.Moving then
			local t = Vector3.new()
			if buttons.W then
				t = t + (setVec(cf.lookVector))
			end
			if buttons.S then
				t = t - (setVec(cf.lookVector))
			end
			if buttons.A then
				t = t - (setVec(cf.rightVector))
			end
			if buttons.D then
				t = t + (setVec(cf.rightVector))
			end
			c:TranslateBy(t * step)
		end
	end
end)


local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Toggled = false
local Keybind = "f"

Mouse.KeyDown:Connect(function(Key)
	if Key == Keybind then
		if Toggled then
			Toggled = false
			nofly()
		else
			Toggled = true
			yesfly()
		end
	end
end)

function GetPlayer(target)
	local plrs = game:GetService("Players"):GetPlayers()
	if target:lower() == "all" then
		return plrs
	elseif target:lower() == "others" then
		for index, plr in pairs(plrs) do
			if plr == game:GetService("Players").LocalPlayer then
				table.remove(plrs, index)
				return plrs
			end
		end
	elseif target:lower() == "me" then
		return {
			game:GetService("Players").LocalPlayer
		}
	else
		local plrTargets = {}
		for index, plr in pairs(plrs) do
			if plr.Name:sub(1, #target):lower() == target:lower() or plr.DisplayName:sub(1, #target):lower() == target:lower() then
				table.insert(plrTargets, plr)
			end
		end
		return plrTargets
	end
end

function AddCommand(CmdName, func)
	Commands[CmdName] = CmdName
	LocalPlayer.Chatted:Connect(function(msg)
		msg = msg:lower()
		args = msg:split(' ')
		if args[1] == Admin.Prefix..CmdName then
			Notify(CmdName)
			wait()
			func()
		elseif args[1] == "/e" and args[2] == Admin.Prefix..CmdName then
			args[2] = args[3]
			wait()
			func()
		end

	end)
	Exec.FocusLost:Connect(function(text)
		if text then
			text = Exec.Text:lower()
			args = text:split(' ')
			if args[1] == Commands[CmdName] then
				Notify(CmdName)
				wait()
				func()
			end
		end
	end)
end
function sync(Time)
	local Objects = game.Players.LocalPlayer.Character:GetDescendants()
	for I = 1, #Objects do
		local Object = Objects[I]
		if game.IsA(Object, 'Sound') then
			Object.TimePosition = Object.TimePosition + 0.00000000000001
		end
	end    
end
AddCommand("resync",function(Time)
	for _, Target in pairs(GetPlayer(args[2])) do
		local Objects = Target.Character:GetDescendants()
		for I = 1, #Objects do
			local Object = Objects[I]
			if game.IsA(Object, 'Sound') then
				Object.TimePosition = 0
			end
		end
	end
end)
AddCommand("replicate",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		for i,v in pairs(Target.Character:GetDescendants()) do
			if v.ClassName == "Tool" and v:FindFirstChild("Handle") and v:FindFirstChildOfClass("RemoteEvent") and v.Handle:FindFirstChildOfClass("Sound") then
				_G.song = v.Handle.Sound.SoundId
			end
		end
		for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
			if v.ClassName == "Tool" and v:FindFirstChild("Handle") and v:FindFirstChildOfClass("RemoteEvent") and v.Handle:FindFirstChildOfClass("Sound") then
				v['Parent'] = game.Players.LocalPlayer.Character
			end
		end
		for i, v in pairs(game.Players.LocalPlayer['Character']:GetChildren()) do
			if string.find(string.lower(v['Name']), 'boomb') then
				local song = _G.song
				local finalSound = string.gsub(tostring(song), "http%:%/%/www%.roblox.com%/asset%/%?id%=", "")
				v.Remote:FireServer("PlaySong", finalSound);
				v.Handle.Massless = true
			end
		end
		wait(.5)
	for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
		if v.ClassName == "Tool" and v:FindFirstChild("Handle") and v:FindFirstChildOfClass("RemoteEvent") and v.Handle:FindFirstChildOfClass("Sound") then
			v.Handle.Sound.TimePosition = Target.Character.BoomBox.Handle.Sound.TimePosition
		end
	end
end

end)


--sync function

AddCommand("sync",function(Time)
	local Objects = LocalPlayer.Character:GetDescendants()
	for I = 1, #Objects do
		local Object = Objects[I]
		if game.IsA(Object, 'Sound') then
			Object.TimePosition = Object.TimePosition + 0.00000000000001
		end
	end
end)

AddCommand("desync",function(Time)
	for _, Target in pairs(GetPlayer(args[2])) do
		local Objects = Target.Character:GetDescendants()
		for I = 1, #Objects do
			local Object = Objects[I]
			if game.IsA(Object, 'Sound') then
				Object.TimePosition = math.random(1,100)
			end
		end
	end
end)


AddCommand("tkill", function()
	for _, Target in pairs(GetPlayer(args[2])) do
		if LocalPlayer.Character.PrimaryPart ~= nil then
			local Character = LocalPlayer.Character
			local previous = LocalPlayer.Character.PrimaryPart.CFrame
			Character.Archivable = true
			local Clone = Character:Clone()
			LocalPlayer.Character = Clone
			wait(3)
			LocalPlayer.Character = Character
			wait(0.35)
			if LocalPlayer.Character and Target.Character and Target.Character.PrimaryPart ~= nil then
				if LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
					LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):Destroy()
				end
				local Humanoid = Instance.new("Humanoid")
				Humanoid.Parent = LocalPlayer.Character
				local Tool = nil
				if LocalPlayer.Character:FindFirstChildOfClass("Tool") then
					Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
				elseif LocalPlayer.Backpack and LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
					Tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
				end
				if Tool ~= nil then
					Tool.Parent = LocalPlayer.Backpack
					local Arm = game.Players.LocalPlayer.Character['Right Arm'].CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0)
					Tool.Grip = Arm:ToObjectSpace(Target.Character.PrimaryPart.CFrame):Inverse()

					Tool.Parent = LocalPlayer.Character
					Workspace.CurrentCamera.CameraSubject = Tool.Handle
					repeat
						wait()
					until not Tool or Tool and (Tool.Parent == Workspace or Tool.Parent == Target.Character)
					Humanoid.Health = 0
					LocalPlayer.Character = nil
				end
			end
			LocalPlayer.CharacterAdded:Wait()
			repeat
				wait()
			until LocalPlayer.Character.PrimaryPart ~= nil

			LocalPlayer.Character:SetPrimaryPartCFrame(previous)
		end
	end
end)
CFrameTool = function(tool, pos)
    local RightArm = LocalPlayer.Character:FindFirstChild("RightLowerArm") or LocalPlayer.Character:FindFirstChild("Right Arm");

    local Arm = RightArm.CFrame * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0);
    local Frame = Arm:toObjectSpace(pos):Inverse();

    tool.Grip = Frame
end
AddCommand("spectate", function()
	for _, Target in pairs(GetPlayer(args[2])) do
		Workspace.CurrentCamera.CameraSubject = Target.Character
	end
end)
AddCommand("unspectate", function()
		Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character
end)
AddCommand("lowhold",function()
	for i, v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
		v:Stop()
	end
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(string.lower(v.Name), 'boomb') then
			v.Grip = CFrame.new(-0.0109999999, 0.633000016, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0)
			v.Parent = game.Players.LocalPlayer.Backpack
            v.Parent = game.Players.LocalPlayer.Character
			v.Handle.Massless = true

		end

	end
end)

AddCommand("backpack",function()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(string.lower(v.Name), 'boomb') then
			v.Grip = CFrame.new(-1.43400002, -0.996999979, 2.11500001, -0.672917426, -0.736945152, 0.0639854819, -0.733912885, 0.675949693, 0.0668134838, -0.0924888402, -0.00199981011, -0.995711744)
			v.GripForward = Vector3.new(-0.0639855, -0.0668135, 0.995712)
			v.GripPos = Vector3.new(-1.434, -0.997, 2.115)
			v.GripRight = Vector3.new(-0.672917, -0.733913, -0.0924888)
			v.GripUp = Vector3.new(-0.736945, 0.67595, -0.00199985)
			v.Parent = game.Players.LocalPlayer.Backpack
            v.Parent = game.Players.LocalPlayer.Character
			v.Handle.Massless = true
		end

	end
end)
local desyncing = false
AddCommand("loopdesync",function()
	desyncing = true
	while desyncing == true do
		wait(1)
		for _, Target in pairs(GetPlayer(args[2])) do
			local Objects = Target.Character:GetDescendants()
			for I = 1, #Objects do
				local Object = Objects[I]
				if game.IsA(Object, 'Sound') then
					Object.TimePosition = math.random(1,100)
				end
			end
		end
	end
end)

AddCommand("tpos",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local Objects = Target.Character:GetDescendants()
		for I = 1, #Objects do
			local Object = Objects[I]
			if game.IsA(Object, 'Sound') then
				Object.TimePosition = tonumber(args[3])
			end
		end
	end
end)
AddCommand("undesync",function()
desyncing = false
end)
local enabled = false
AddCommand("chatspy",function()
	enabled = true
	spyOnMyself = true
	public = false
	publicItalics = false
	name = HASH
	yeah = "//////////////////////////////////////////////////////////////////////////////////////////////////////"

	privateProperties = {
		Color = Color3.fromRGB(0, 255, 255); 
		Font = Enum.Font.SourceSansBold;
		TextSize = 18;
	}
	--////////////////////////////////////////////////////////////////
	local StarterGui = game:GetService("StarterGui")
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
	local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
	local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
	local instance = (_G.chatSpyInstance or 0) + 1
	_G.chatSpyInstance = instance

	local function onChatted(p, msg)
		if _G.chatSpyInstance == instance then
			if p == player and msg:lower():sub(1, 6) == yeah then
				enabled = not enabled
				wait(0.3)
				privateProperties.Text = "{HASH "..(enabled and "EN" or "DIS").."ABLED}"
				StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
			elseif enabled and (spyOnMyself == true or p ~= player) then
				msg = msg:gsub("[\n\r]", ''):gsub("\t", ' '):gsub("[ ]+", ' ')
				local hidden = true
				local conn = getmsg.OnClientEvent:Connect(function(packet, channel)
					if packet.SpeakerUserId == p.UserId and packet.Message == msg:sub(#msg - #packet.Message + 1) and (channel == "All" or (channel == "Team" and public == false and p.Team == player.Team)) then
						hidden = false
					end
				end)
				wait(1)
				conn:Disconnect()
				if hidden and enabled then
					if public then
						saymsg:FireServer((publicItalics and "/me " or '').."{HASH} [".. p.Name .."]: "..msg, "All")
					else
						privateProperties.Text = "{HASH} [".. p.Name .."]: "..msg
						StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
					end
				end
			end
		end
	end

	for _, p in ipairs(Players:GetPlayers()) do
		p.Chatted:Connect(function(msg)
			onChatted(p, msg)
		end)
	end
	Players.PlayerAdded:Connect(function(p)
		p.Chatted:Connect(function(msg)
			onChatted(p, msg)
		end)
	end)
	privateProperties.Text = "{HASH "..(enabled and "EN" or "DIS").."ABLED}"
	player:WaitForChild("PlayerGui"):WaitForChild("Chat")
	StarterGui:SetCore("ChatMakeSystemMessage", privateProperties)
	wait(3)
	local chatFrame = player.PlayerGui.Chat.Frame
	chatFrame.ChatChannelParentFrame.Visible = true
	chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), chatFrame.ChatChannelParentFrame.Size.Y)
end)
--sync function
function sync(Time)
	local Objects = LocalPlayer.Character:GetDescendants()
	for I = 1, #Objects do
		local Object = Objects[I]
		if game.IsA(Object, 'Sound') then
			Object.TimePosition = Time
		end
	end    
end
AddCommand("log",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local Sounds, Boombox = {};
		for A,B in next, Target.Character:GetChildren() do
			if B['Name']:lower():find('boombox') or B['Name']:lower():find('radio') then
				for C,D in next, B:GetDescendants() do
					if D:IsA('Sound') then
						if D['Playing'] ~= false and D['IsLoaded'] ~= false then
							Boombox = B; Sounds[#Sounds+1] = D; break
						end
					end
				end
			end
		end
		if Boombox == nil then
			for A,B in next, Target['Backpack']:GetChildren() do
				if B['Name']:lower():find('boombox') or B['Name']:lower():find('radio') then
					for C,D in next, B:GetDescendants() do
						if D:IsA('Sound') then
							if D['Playing'] ~= false and D['IsLoaded'] ~= false then
								Boombox = B; Sounds[#Sounds+1] = D; break
							end
						end
					end
				end
			end
		end
		if #Sounds < 1 then
			print('Error: user not holding a boombox')
		end
		local Sound = {nil,-1};
		for K,V in next, Sounds do
			if V['PlaybackLoudness'] > Sound[2] then
				Sound[1] = V; Sound[2] = V['PlaybackLoudness']
			end
		end
		local finalSound = string.gsub(tostring(Sound[1].SoundId), "http%:%/%/www%.roblox.com%/asset%/%?id%=", "")
		setclipboard(finalSound)
	end
end)
AddCommand("lograw",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local Sounds, Boombox = {};
		for A,B in next, Target.Character:GetChildren() do
			if B['Name']:lower():find('boombox') or B['Name']:lower():find('radio') then
				for C,D in next, B:GetDescendants() do
					if D:IsA('Sound') then
						if D['Playing'] ~= false and D['IsLoaded'] ~= false then
							Boombox = B; Sounds[#Sounds+1] = D; break
						end
					end
				end
			end
		end
		if Boombox == nil then
			for A,B in next, Target['Backpack']:GetChildren() do
				if B['Name']:lower():find('boombox') or B['Name']:lower():find('radio') then
					for C,D in next, B:GetDescendants() do
						if D:IsA('Sound') then
							if D['Playing'] ~= false and D['IsLoaded'] ~= false then
								Boombox = B; Sounds[#Sounds+1] = D; break
							end
						end
					end
				end
			end
		end
		if #Sounds < 1 then
			print('Error: user not holding a boombox')
		end
		local Sound = {nil,-1};
		for K,V in next, Sounds do
			if V['PlaybackLoudness'] > Sound[2] then
				Sound[1] = V; Sound[2] = V['PlaybackLoudness']
			end
		end
		local finalSound = tostring(Sound[1].SoundId)
		setclipboard(finalSound)
	end
end)

AddCommand("decode",function()
	
for _, Target in pairs(GetPlayer(args[2])) do
		local Sounds, Boombox = {};
		for A,B in next, Target.Character:GetChildren() do
			if B['Name']:lower():find('boombox') or B['Name']:lower():find('radio') then
				for C,D in next, B:GetDescendants() do
					if D:IsA('Sound') then
						if D['Playing'] ~= false and D['IsLoaded'] ~= false then
							Boombox = B; Sounds[#Sounds+1] = D; break
						end
					end
				end
			end
		end
		if Boombox == nil then
			for A,B in next, Target['Backpack']:GetChildren() do
				if B['Name']:lower():find('boombox') or B['Name']:lower():find('radio') then
					for C,D in next, B:GetDescendants() do
						if D:IsA('Sound') then
							if D['Playing'] ~= false and D['IsLoaded'] ~= false then
								Boombox = B; Sounds[#Sounds+1] = D; break
							end
						end
					end
				end
			end
		end
		if #Sounds < 1 then
			print('Error: user not holding a boombox')
		end
		local Sound = {nil,-1};
		for K,V in next, Sounds do
			if V['PlaybackLoudness'] > Sound[2] then
				Sound[1] = V; Sound[2] = V['PlaybackLoudness']
			end
		end
	writefile('did.txt', Sound[1].SoundId)
end

	did = readfile('did.txt')
	warn(did)
	warn("-----------------------------------")
	local decoded = string.gsub(did,"[%s\\%:%*%'%+%#%@%!%^%(%)%{%}%[%]%-%_%`%~]","")

	decoded = string.gsub(decoded,"â","")
	decoded = string.gsub(decoded,"€","")
	decoded = string.gsub(decoded,"Ž","")
	decoded = string.gsub(decoded,"¬","")
	decoded = string.gsub(decoded,"ª","")
	decoded = string.gsub(decoded,"«","")
	decoded = string.gsub(decoded,"%c","")
	decoded = string.gsub(decoded, "[^%a%&%=%d]","")
	decoded = string.match(decoded,"%&assetVersionId=%wx%w%w%w%w%w%w%w%w")
	decoded = string.gsub(decoded,"%&assetVersionId=", "")
	decoded = tonumber(decoded)
	wait(.5)
	setclipboard(decoded)

local check = "http://hash.infinityfreeapp.com/index.php?avid="..decoded
local final = game:HttpGet(check)
warn(final)
end)
AddCommand("massplay",function()

	local idk = "nigga ⛆ ⛆ ⛆ ⛆ ⛆ ⛆"
	local player = game.Players.LocalPlayer.Name
	local normalid = args[2]

	local char_to_hex = function(c)
		return string.format("%%%02X", string.byte(c))
	end

	local function urlencode(url)
		if url == nil then
			return
		end 
		url = url:gsub("\n", "\r\n")
		url = url:gsub(".", char_to_hex)
		url = url:gsub(" ", "+")
		return url
	end
	function FixId(id)
		local dab = game:HttpGet("https://www.roblox.com/studio/plugins/info?assetId="..id)
		if string.find(dab, 'value="') then
			local epic = string.find(dab, 'value="')
			local almost = string.sub(dab, epic + 7, epic + 18)
			local filter1 = string.gsub(almost, " ", "")
			local filter2 = string.gsub(filter1, "/", "")
			local filter3 = string.gsub(filter2, ">", "")
			local filter4 = string.gsub(filter3, '"', "")
			local versionid = string.gsub(filter4, "<", "")
			return versionid
		end
	end

	local encid = urlencode(FixId(normalid))
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v.ClassName == "Tool" and v:FindFirstChild("Handle") and v:FindFirstChildOfClass("RemoteEvent") and v.Handle:FindFirstChildOfClass("Sound") then
			v.Parent = game.Players.LocalPlayer.Character
		end
	end
	local hidden = "" .. "CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_CAUGHT_IN_4K_".. "&%61%73%73%65%74%76%65%72%73%69%6f%6e%69%64=" .. encid --add here!!
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(string.lower(v.Name), 'boomb') then
			v.Remote:FireServer("PlaySong", hidden);
			v.Handle.Massless = true
		end
	end
	wait(1.5)
	sync();

end)
AddCommand("demesh",function()
	for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v:IsA("Tool") then
			for _,x in pairs(v:GetDescendants()) do
				if x.Name == "Mesh" or x.Name == "SpecialMesh" then
					x:Destroy()
				end
			end
		end
	end
	for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") then
			for _,x in pairs(v:GetDescendants()) do
				if x.Name == "Mesh" or x.Name == "SpecialMesh" then
					x:Destroy()
				end
			end
		end
	end
end)
AddCommand("checktools",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local toolsInBackpack = 0
		local toolsEquipped = 0
		local toolsPlaying = 0
		for i,v in pairs(game.Players[Target.Name].Backpack:GetChildren()) do
			toolsInBackpack = toolsInBackpack + 1
		end
		for i,v in pairs(game.Players[Target.Name].Character:GetChildren()) do
			if v.ClassName == "Tool" then
				toolsEquipped = toolsEquipped + 1
			end
		end
		for i,v in pairs(game.Players[Target.Name].Character:GetChildren()) do
			if v.ClassName == "Tool" and v.Handle.Sound.IsPlaying then
				toolsPlaying = toolsPlaying + 1
			end
		end
		wait(.5)
		warn(tostring(Target.DisplayName)..'('..Target.Name..')'..': '..toolsInBackpack + toolsEquipped)
		Chat:FireServer('User '..tostring(Target.DisplayName)..'[@'..Target.Name..']'..' has: '..toolsInBackpack + toolsEquipped.. ' tool(s). Tools playing: '..toolsPlaying,'All')
	end
end)

AddCommand("accountage",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		wait(.5)
		local Years = string.split(Target.AccountAge/365,".")
		Chat:FireServer(Years[1].." years or "..Target.AccountAge.." days", "All")
	end
end)
AddCommand("unchatspy",function()
	enabled = false
end)

AddCommand("fly",function()
	wait(.1)
	yesfly()
end)

AddCommand("unfly",function()
	wait(.1)
	nofly()
end)


AddCommand("cmds",function()

	local ScreenSize = workspace.Camera.ViewportSize

	local CommandGui = Instance.new("ScreenGui")
	gui.Parent = game.CoreGui
	local CommandFrame  = Instance.new("ScrollingFrame")
	CommandFrame['Parent'] = gui
	CommandFrame.Active = true
	CommandFrame['BackgroundColor3'] = Color3.fromRGB(35, 35, 35)
	CommandFrame['BorderSizePixel'] = 0
	CommandFrame['AnchorPoint'] = Vector2.new(0.5,0,0.5,0)
	CommandFrame['Position'] = UDim2.new(0.5,0,0.5,0)
	CommandFrame['Size'] = UDim2.new(0, ScreenSize.X/8, 0, ScreenSize.Y/3)
	CommandFrame.ScrollBarThickness = 4
	local UIL = Instance.new('UIListLayout')
	UIL.Parent = CommandFrame
	local cmdnum = 0
	for i,v in pairs(Commands) do
		local command = Instance.new("TextLabel")
		local UIA = Instance.new("UIAspectRatioConstraint")
		UIA.Parent = command
		UIA.AspectRatio = 8
		command['Name'] = i
		command['Parent'] = CommandFrame
		command['BackgroundColor3'] = Color3.fromRGB(35, 35, 35)
		command['BorderSizePixel'] = 0
		command['AnchorPoint'] = Vector2.new(0.5,0,0.5,0)
		command['Size'] = UDim2.new(0, 200, 0, 50)
		command['Font'] = Enum['Font'].Gotham
		command.Text = i
		command.TextColor3 = Color3.fromRGB(255, 255, 255)
		command.TextSize = 14.000
		cmdnum += 1
	end
	wait(.5)
	Chat:FireServer("Commands: "..cmdnum, "All")
end)

AddCommand("shop",function()
	rejoining = true
	if syn.queue_on_teleport then
		syn.queue_on_teleport('game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()')
	end
	local Decision = "any" or arguments[2]
	local GUIDs = {}
	local maxPlayers = 0
	local Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
	for i = 1, 100 do
		for i, v in pairs(Http.data) do
			if v.playing ~= v.maxPlayers then
				maxPlayers = v.maxPlayers
				table.insert(GUIDs, {
					id = v.id,
					users = v.playing
				})
			end
		end
		if Http.nextPageCursor ~= null then
			Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Http.nextPageCursor))
		else
			break
		end
	end
	if Decision == "any" then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1, #GUIDs)].id, LocalPlayer)
	elseif Decision == "smallest" then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[#GUIDs].id, LocalPlayer)
	elseif Decision == "largest" then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[1].id, LocalPlayer)
	else
	end
	wait(3)
	rejoining = false
end)
AddCommand("to",function()
	function tween_distance(obj, dist, time)
		local tween = game:GetService("TweenService")
		local ti = TweenInfo.new(time, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
		local tw = tween:Create(obj, ti, {CFrame = dist})
		tw:Play()
	end
	for _, Target in pairs(GetPlayer(args[2])) do
		tween_distance(LocalPlayer.Character.HumanoidRootPart, Target.Character.Head.CFrame, .2)
		Character.Humanoid.Sit = true
		wait(.2)
		Character.Humanoid.Sit = false
	end
end)
_G.connections = {}
_G.connections.muted = {}
function MuteLoop()
	_G.connections.plrsMuted = game:GetService("RunService").RenderStepped:Connect(function()
		pcall(function()
			for _, v in pairs(_G.connections.muted) do
				pcall(function()
					for _, i in pairs(v.Character:GetChildren()) do
						if i:IsA("Tool") and i:FindFirstChild("Handle") then
							if i.Handle:FindFirstChildOfClass("Sound") then
								i.Handle.Sound.Playing = false
							end
						end
					end
					for _, i in pairs(v.Backpack:GetChildren()) do
						if i:IsA("Tool") and i:FindFirstChild("Handle") then
							if i.Handle:FindFirstChildOfClass("Sound") then
								i.Handle.Sound.Playing = false
							end
						end
					end
				end)
			end
		end)
	end)
end
MuteLoop()
AddCommand("mute",function()
	if args[2] == "all" then
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v ~= LocalPlayer then
				table.insert(_G.connections.muted, v)
			end
		end
		_G.connections.allMuted = game:GetService("Players").PlayerAdded:Connect(function(v)
			table.insert(_G.connections.muted, v)
		end)
	else
		target = findplr(args[2])
		if not target then
			return
		end
		table.insert(_G.connections.muted, target)
	end
end)

AddCommand("unmute",function()
	if args[2] == "all" then
		for i, _ in pairs(_G.connections.muted) do
			table.remove(_G.connections.muted, i)
		end
		_G.connections.allMuted:Disconnect()
	else
		target = findplr(args[2])
		if not target then
			return
		end

		for i, v in pairs(_G.connections.muted) do
			if v == target then
				table.remove(_G.connections.muted, i)
			end
		end
	end
end)
AddCommand("pee", function()
Chat:FireServer("test", "All")
end)
AddCommand("antikill",function()
	game.Players.LocalPlayer.Character.Parent = nil
	game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):Destroy()
	game.Players.LocalPlayer.Character.Parent = workspace
end)

AddCommand("kill",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
		Instance.new("Humanoid", LocalPlayer.Character)
		LocalPlayer.Character.Humanoid:Destroy()
		local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		local Player = game.Players:FindFirstChild(Target.Name)
		tool.Parent = LocalPlayer.Character
		DeltaWait(0)
		firetouchinterest(tool.Handle, Player.Character['Head'],0)
		firetouchinterest(tool.Handle, Player.Character['Head'],1)
		repeat DeltaWait() until tool.Parent ~= LocalPlayer.Character
		LocalPlayer.Character.Humanoid.Health = 0
		LocalPlayer.Character = nil
		LocalPlayer.CharacterAdded:wait()
		repeat
			DeltaWait(0)
		until LocalPlayer.Character.HumanoidRootPart
		wait(.5)
		LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
	end
end)

local killing = false

AddCommand("loopkill",function()
	killing = true
	for _, Target in pairs(GetPlayer(args[2])) do
		function kill()
			local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
			Instance.new("Humanoid", LocalPlayer.Character)
			LocalPlayer.Character.Humanoid:Destroy()
			local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
			local Player = game.Players:FindFirstChild(Target.Name)
			tool.Parent = LocalPlayer.Character
			DeltaWait(0)
			firetouchinterest(tool.Handle, Player.Character['Head'],0)
			repeat DeltaWait() until tool.Parent ~= LocalPlayer.Character
			LocalPlayer.Character.Humanoid.Health = 0
			LocalPlayer.Character = nil
			LocalPlayer.CharacterAdded:wait()
			repeat
				DeltaWait(0)
			until LocalPlayer.Character.HumanoidRootPart
			wait()
			LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
		end
		while killing == true do
			kill()
			repeat wait() until game.Players.LocalPlayer.Character
			wait(.1)
			repeat wait() until Target.Character
			wait(.5)
		end
	end
end)

AddCommand("unloopkill",function()
	killing = false
end)

AddCommand("bring",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
		Instance.new("Humanoid", LocalPlayer.Character)
		LocalPlayer.Character.Humanoid:Destroy()
		local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		local Player = game.Players:FindFirstChild(Target.Name)
		tool.Parent = LocalPlayer.Character
		LocalPlayer.Character["Right Arm"].CFrame = Player.Character.Head.CFrame
		repeat
			wait()
			wait(.5)
			Player.Character:SetPrimaryPartCFrame(tool.Handle.CFrame)
		until tool.Parent ~= LocalPlayer.Character
		repeat
		until tool.Parent ~= LocalPlayer.Character
		LocalPlayer.Character.Humanoid.Health = 0
		LocalPlayer.CharacterAdded:wait() -- waits for character to spawn
		repeat
			wait()
		until LocalPlayer.Character.HumanoidRootPart
		wait(.4)
		LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
	end
end)


AddCommand("kanye",function()
	local Chat = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
	local check = "https://api.kanye.rest/"
	local final = game:HttpGet(check)
	local final2 = string.gsub(final,'"quote"',"")
	local final3 = string.gsub(final2,"[%{%:%}]","")
	Chat:FireServer(final3.." - Kanye West","All")
end)


AddCommand("joke",function()
	coroutine.wrap(function()
	local Chat = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
	local HttpService = game:GetService('HttpService')
	local check = "https://official-joke-api.appspot.com/jokes/programming/random"
	local final1 = game:HttpGet(check)
	local final = string.gsub(final1, "[%[%]]", "")
	local decoded = HttpService:JSONDecode(final)
	
	Chat:FireServer(decoded.setup, "All")
	wait(2)
	Chat:FireServer(decoded.punchline, "All")
	end)()
end)
AddCommand("test",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
		Instance.new("Humanoid", LocalPlayer.Character)
		game.Players.LocalPlayer.Character.Humanoid:Destroy()
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		tool.Handle.Massless = true
		tool.Parent = game.Players.LocalPlayer.Character
		DeltaWait()
		firetouchinterest(tool.Handle, Target.Character['Head'],0)
		repeat DeltaWait() until tool.Parent ~= LocalPlayer.Character
		local loop = game:GetService('RunService').Stepped:Connect(function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,-9e+18,0)
		end)
		wait(3)
		loop:Disconnect()
	end
end)

AddCommand("delete",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
		Instance.new("Humanoid", LocalPlayer.Character)
		game.Players.LocalPlayer.Character.Humanoid:Destroy()
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		tool.Handle.Massless = true
		tool.Parent = game.Players.LocalPlayer.Character
		DeltaWait()
		firetouchinterest(tool.Handle, Target.Character['Head'],0)
		repeat DeltaWait() until tool.Parent ~= LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,9e+18,0)
		LocalPlayer.CharacterAdded:Wait()
		repeat DeltaWait(0) until LocalPlayer.Character.HumanoidRootPart
		wait(.5)
		LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
	end
end)
local antitooling = false
AddCommand("antitool", function()
	antitooling = true
	while antitooling == true do
		DeltaWait(0)
		Character.Humanoid:UnequipTools()
		DeltaWait(0)
	end
end)

AddCommand("rarm", function()
	game.Players.LocalPlayer.Character['Right Arm']:Destroy()
end)

AddCommand("unantitool", function()
	antitooling = false
end)
AddCommand("reset",function()
	local ogChar = LocalPlayer.Character
	LocalPlayer.Character = Clone
	LocalPlayer.Character = ogChar
	wait(4.9)
	local pos = LocalPlayer.Character.HumanoidRootPart.CFrame
	LocalPlayer.Character:BreakJoints()
	LocalPlayer.CharacterAdded:wait();
	repeat
		wait()
	until LocalPlayer.Character
	wait(.2)
	LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)

AddCommand("ignore",function()
	local MuteRequest = game.ReplicatedStorage.DefaultChatSystemChatEvents.MutePlayerRequest
	for _, Target in pairs(GetPlayer(args[2])) do
		MuteRequest:InvokeServer(Target.Name);
        if (Target.Character) then
			Target.Character.HumanoidRootPart.CFrame = CFrame.new(0,500,0)
            Target.Character.Parent = game.ReplicatedStorage
        end
	end
end)

AddCommand("unignore",function()
	local UnMuteRequest = game.ReplicatedStorage.DefaultChatSystemChatEvents.UnMutePlayerRequest
	for _, Target in pairs(GetPlayer(args[2])) do
		UnMuteRequest:InvokeServer(Target.Name);
		if (Target.Character and Target.Character.Parent == game.ReplicatedStorage) then
            Target.Character.Parent = workspace
		end
	end
end)

AddCommand("script",function()
	wait(.2)
	Chat:FireServer(Admin.Name.." | "..Admin.Version, "All")
end)

local toolsget = false
AddCommand("gtools",function()
	toolsget = true
	for i, v in pairs(workspace:GetChildren()) do
		if v:IsA("Tool") then
			local ti1 = v.Handle
			firetouchinterest(LocalPlayer.Character['Head'],ti1 , 0)
		end
	end
	workspace.ChildAdded:Connect(function(pt)
		if toolsget == true then
			if pt:IsA("Tool") then
				local ti = pt.Handle
				firetouchinterest(LocalPlayer.Character['Head'],ti , 0)
			end
		end
	end)
end)

AddCommand("ungtools",function()
	toolsget = false
end)
AddCommand("dupe", function()
	local AmountToDupe = tonumber(args[2])

	local plr = game.Players.LocalPlayer
	local char = plr.Character
	local pos = char.HumanoidRootPart.Position
	local http = game:GetService("HttpService")

	local file = 'rejoindupe.json'
	writefile(file, http:JSONEncode({
		['AmountToDupe'] = AmountToDupe - 2,
		['CurrentAmount'] = 0
	}))
	char.HumanoidRootPart.CFrame = CFrame.new(0, 999999, 0)
	for i, v in pairs(plr.Backpack:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = char
		end
	end
	wait(.3)
	for i, v in pairs(char:GetChildren()) do
		if v:IsA("Tool") then
			v.Parent = workspace
		end
	end

	local dupescript = [[
       game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
       repeat wait() until game.Players.LocalPlayer
       repeat wait() until game.Players.LocalPlayer.Character
       repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(%s)
       local plr = game.Players.LocalPlayer
       local char = plr.Character
       local file = "%s"
       local a = readfile(file)
       local data = game:GetService("HttpService"):JSONDecode(a)
       if data['CurrentAmount'] >= data['AmountToDupe'] then
           wait(.5)
           for i,v in pairs(workspace:GetChildren()) do
               if v:IsA("Tool") then
                   char.Humanoid:EquipTool(v)
               end
           end
           return
       else
           wait()
           char.HumanoidRootPart.CFrame = CFrame.new(0,999999,0)
           for i,v in pairs(plr.Backpack:GetChildren()) do
               if v:IsA("Tool") then
                   v.Parent = char
               end
           end
           wait(.6)
           for i,v in pairs(char:GetChildren()) do
               if v:IsA("Tool") then
                   v.Parent = workspace
               end
           end
           wait(.1)
           data['CurrentAmount'] = data['CurrentAmount'] + 1
           writefile(file,game:GetService("HttpService"):JSONEncode(data))
       end
       syn.queue_on_teleport(readfile("%s"))
       repeat
       game:GetService("TeleportService"):Teleport(game.PlaceId)    
       wait(0.5)
       until nil
    ]]
	dupescript = string.format(dupescript, tostring(pos), file, "dupescript.lua")

	writefile('dupescript.lua', dupescript)
	syn.queue_on_teleport(dupescript)
	game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

AddCommand("dupefor", function()
for _, Target in pairs(GetPlayer(args[2])) do
local AmountToDupe = args[3]
local Target = tostring(Target)
-------------------------------------------------------






function findplr(args)
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        if string.find(string.lower(v.Name), string.lower(args)) then
            return v
        end
    end
end
    local http = game:GetService("HttpService")
    local targetfile = 'targetdupe.json'
        writefile(targetfile, http:JSONEncode({
        ['Target'] = tostring(Target)
    }))
    local Player = findplr(Target)
    local plr = game.Players.LocalPlayer
    local char = plr.Character
    local pos = char.HumanoidRootPart.Position


    
    local file = 'rejoindupe.json'
    writefile(file, http:JSONEncode({
        ['AmountToDupe'] = AmountToDupe - 2,
        ['CurrentAmount'] = 0
    }))
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
        tool.Parent = game.Players.LocalPlayer.Character
        wait()
        game.Players.LocalPlayer.Character.Humanoid:Destroy()
        tool.Parent = workspace
        wait()
        firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 0)
        firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 1)
        Player.Character.Humanoid:EquipTool(tool)

    local dupescript = [[
       game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
       repeat wait() until game.Players.LocalPlayer
       repeat wait() until game.Players.LocalPlayer.Character
       repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(%s)
           local http = game:GetService("HttpService")
       function findplr(args)
            for _, v in pairs(game:GetService("Players"):GetPlayers()) do
                if string.find(string.lower(v.Name), string.lower(args)) then
                    return v
                end
            end
        end
        
        local JSONDecode = function(Input)
            return game:GetService('HttpService'):JSONDecode(Input)
        end
        local Data = JSONDecode(readfile('targetdupe.json'))
        local Player = findplr(Data.Target)
       local plr = game.Players.LocalPlayer
       local char = plr.Character
       local file = "%s"
       local a = readfile(file)
       local data = game:GetService("HttpService"):JSONDecode(a)
       if data['CurrentAmount'] >= data['AmountToDupe'] then
           wait(.5)
                print("done")
           return
       else
           wait()
           local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
           tool.Parent = game.Players.LocalPlayer.Character
           wait()
           game.Players.LocalPlayer.Character.Humanoid:Destroy()
           tool.Parent = workspace
           wait()
           firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 0)
           firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 1)
           Player.Character.Humanoid:EquipTool(tool)
           wait(.1)
           data['CurrentAmount'] = data['CurrentAmount'] + 1
           writefile(file,game:GetService("HttpService"):JSONEncode(data))
       end
       syn.queue_on_teleport(readfile("%s"))
       repeat
       game:GetService("TeleportService"):Teleport(game.PlaceId)    
       wait(0.5)
       until nil
    ]]
    dupescript = string.format(dupescript, tostring(pos), file, "dupescript.lua")

    writefile('dupescript.lua', dupescript)
    syn.queue_on_teleport(dupescript)
    game:GetService("TeleportService"):Teleport(game.PlaceId)
	end
end)

AddCommand("jobid", function()
	setclipboard(game.JobId)
end)

AddCommand("prefix", function()
	writefile("DWPrefix.lua", tostring(args[2]))
end)

AddCommand("teleport", function()
local JobId = args[2]
local PlaceId = 417267366
local TeleportService = game:GetService("TeleportService")

TeleportService:TeleportToPlaceInstance(PlaceId, JobId, game.Players.LocalPlayer)
end)

AddCommand("rjre", function()
	if not syn.queue_on_teleport then
	end
	rejoining = true
	local c = LocalPlayer.Character.Head.CFrame
	syn.queue_on_teleport(string.format([[
    game:GetService('ReplicatedFirst'):RemoveDefaultLoadingScreen()
    local playeradded, charadded
    playeradded = game:GetService('Players').PlayerAdded:Connect(function(plr)
        charadded = plr.CharacterAdded:Connect(function(char)
            char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(%f, %f, %f)
            charadded:Disconnect()
        end)
        playeradded:Disconnect()
    end)
]], c.X, c.Y, c.Z))
	game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players"))
	wait(3)
	rejoining = false
end)

AddCommand("rj", function()
	rejoining = true
	game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players"))
	wait(3)
	rejoining = false
end)

AddCommand("spin",function()
	local Spin = Instance.new("BodyAngularVelocity", LocalPlayer.Character.HumanoidRootPart)
	Spin.Name = "Spinning"
	Spin.AngularVelocity = Vector3.new(0, 20, 0)
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
end)
local nodefault = true
AddCommand("nodefault",function()
while nodefault == true do
    game:GetService('RunService').RenderStepped:Wait()
for _,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do 
    if v.Name == "ChooseSongGui" then
        v:Destroy()
	end
end
end
end)

AddCommand("unnodefault",function()
		nodefault = false
	end)

AddCommand("spinhats",function()
	for i, v in pairs(LocalPlayer.Character:GetChildren()) do
		if v:IsA("Accessory") then
			local findForce = v.Handle:FindFirstChildOfClass("BodyForce")
			if findForce == nil then
				local a = Instance.new("BodyPosition")
				local b = Instance.new("BodyAngularVelocity")
				a.Parent = v.Handle
				b.Parent = v.Handle
				a.Name = "un"
				b.Name = "un2"
				v.Handle.AccessoryWeld:Destroy()
				b.AngularVelocity = Vector3.new(0, 100, 0)
				b.MaxTorque = Vector3.new(0, 200, 0)
				a.P = 30000
				a.D = 50
				game:GetService('RunService').Stepped:connect(function()
					a.Position = LocalPlayer.Character.Torso.Position
				end)
			end
		end
	end
end)

AddCommand("unspin", function()
	for i, v in pairs(LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
end)

AddCommand("noclip",function()
	Clip = false
	function NoclipLoop()
		if Clip == false and LocalPlayer.Character ~= nil then
			for _, child in pairs(LocalPlayer.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
		end
	end
	Noclipping = game:GetService('RunService').Stepped:connect(NoclipLoop)
end)

AddCommand("clip",function()
	if Noclipping then
		Noclipping:Disconnect()
	end
	Clip = true
	LocalPlayer.Character.HumanoidRootPart.CanCollide = false
end)

AddCommand("sit",function()
	if Noclipping then
		Noclipping:Disconnect()
	end
	Clip = true
	LocalPlayer.Character.HumanoidRootPart.CanCollide = false
	game.Players.LocalPlayer.Character.Humanoid.Sit = true
end)

AddCommand("walkspeed",function()
	local walkspeed = args[2]
	LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed
end)
--fffff
AddCommand("spook",function()
	local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
	for _, Target in pairs(GetPlayer(args[2])) do
		distancepl = 2
		if Target.Character and Target.Character:FindFirstChild('Humanoid') then
			LocalPlayer.Character.HumanoidRootPart.CFrame =
				Target.Character.HumanoidRootPart.CFrame +  Target.Character.HumanoidRootPart.CFrame.lookVector * distancepl
			LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(LocalPlayer.Character.HumanoidRootPart.Position, Target.Character.HumanoidRootPart.Position)
			wait(.5)
			LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
		end
	end
end)

AddCommand("fp",function()
	local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
	for _, Target in pairs(GetPlayer(args[2])) do
		local Player = Target
		local song = tonumber(args[3])
		local plr = game.Players.LocalPlayer
		local char = plr.Character
		local pos = char.HumanoidRootPart.Position
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
		tool.Parent = game.Players.LocalPlayer.Character
		tool.Remote:FireServer("PlaySong", song)
		tool.Handle.Sound.Playing = false
		local poo = tool
		poo:GetPropertyChangedSignal("Parent"):Connect(function()
		tool.Handle.Sound:Play()
		end)
		wait()
		game.Players.LocalPlayer.Character.Humanoid:Destroy()
		tool.Parent = workspace
		wait()
		firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 0)
		firetouchinterest(Player.Character.PrimaryPart, tool.Handle, 1)
		Player.Character.Humanoid:EquipTool(tool)
		tool.Handle.Sound.Playing = true
		wait(5.5)
		LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
	
	end
end)

AddCommand("hampster", function()
	local Others = game.Players:GetPlayers() 
    for Index, Player in pairs(Others) do 
       if Player == LocalPlayer then 
           table.remove(Others, Index)
           end
    end
    local pos = LocalPlayer.Character.HumanoidRootPart.CFrame 
    local CurrentT = #LocalPlayer.Backpack:GetChildren()
    local Grip = 5
    pcall(function()
    for Index,Target in pairs(Others) do 
        Grip = Grip + 3
        if Target.Character and Target.Character.PrimaryPart then 
            if not LocalPlayer.Character:FindFirstChild('Executed') then
                LocalPlayer.Character.Humanoid:remove()
                local a = Instance.new('Humanoid', LocalPlayer.Character)
                a.Name = 'Executed'
            end  
        local Tool = LocalPlayer.Backpack:FindFirstChildOfClass'Tool' 
        Tool.Parent = LocalPlayer.Character
		Tool.Handle.Sound.Playing = false
		Tool:GetPropertyChangedSignal("Parent"):Connect(function()
			Tool.Handle.Sound:Play()
		end)
		Tool.Remote:FireServer("PlaySong", 4923841771)
        Tool.Grip = Tool.Grip * CFrame.new(Vector3.new(Grip, 0, 0))
        Tool.Handle.Massless = true 
        Target.Character:SetPrimaryPartCFrame(Tool.Handle.CFrame)
        end 
    end 
    end) -- pcall in case the localplayer doesnt have enough tools it still kills
    repeat wait() until #LocalPlayer.Backpack:GetChildren() < CurrentT
	wait(1)
	LocalPlayer.Character:Destroy()
	LocalPlayer.Character = nul
	LocalPlayer.Character['Executed'].Health = 0
    LocalPlayer.Character:SetPrimaryPartCFrame(pos)
end)

AddCommand("voidall", function()
	local Others = game.Players:GetPlayers() 
    for Index, Player in pairs(Others) do 
       if Player == LocalPlayer then 
           table.remove(Others, Index)
           end
    end
    local pos = LocalPlayer.Character.HumanoidRootPart.CFrame 
    local CurrentT = #LocalPlayer.Backpack:GetChildren()
    local Grip = 5
    pcall(function()
    for Index,Target in pairs(Others) do 
        Grip = Grip + 3
        if Target.Character and Target.Character.PrimaryPart then 
            if not LocalPlayer.Character:FindFirstChild('Executed') then
				Instance.new("Humanoid", LocalPlayer.Character)
				game.Players.LocalPlayer.Character.Humanoid:Destroy()
                local a = Instance.new('Humanoid', LocalPlayer.Character)
                a.Name = 'Executed'
            end  
        local Tool = LocalPlayer.Backpack:FindFirstChildOfClass'Tool' 
        Tool.Parent = LocalPlayer.Character
        Tool.Grip = Tool.Grip * CFrame.new(Vector3.new(Grip, 0, 0))
        Tool.Handle.Massless = true 
        Target.Character:SetPrimaryPartCFrame(Tool.Handle.CFrame)
        end 
    end 
    end) -- pcall in case the localplayer doesnt have enough tools it still kills
    repeat wait() until #LocalPlayer.Backpack:GetChildren() < CurrentT
	wait(1)
	LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,9e+18,0)
end)

AddCommand("killall", function()
	local Others = game.Players:GetPlayers() 
    for Index, Player in pairs(Others) do 
       if Player == LocalPlayer then 
           table.remove(Others, Index)
           end
    end
    local pos = LocalPlayer.Character.HumanoidRootPart.CFrame 
    local CurrentT = #LocalPlayer.Backpack:GetChildren()
    local Grip = 5
    pcall(function()
    for Index,Target in pairs(Others) do 
        Grip = Grip + 3
        if Target.Character and Target.Character.PrimaryPart then 
            if not LocalPlayer.Character:FindFirstChild('Executed') then
                LocalPlayer.Character.Humanoid:remove()
                local a = Instance.new('Humanoid', LocalPlayer.Character)
                a.Name = 'Executed'
                a:ChangeState(15)
            end  
        local Tool = LocalPlayer.Backpack:FindFirstChildOfClass'Tool' 
        Tool.Parent = LocalPlayer.Character
        Tool.Grip = Tool.Grip * CFrame.new(Vector3.new(Grip, 0, 0))
        Tool.Handle.Massless = true 
        Target.Character:SetPrimaryPartCFrame(Tool.Handle.CFrame)
        end 
    end 
    end) -- pcall in case the localplayer doesnt have enough tools it still kills11
    repeat wait() until #LocalPlayer.Backpack:GetChildren() < CurrentT
    wait(.2)
    local ret = LocalPlayer.Character
    LocalPlayer.Character['Executed'].Health = 0
    LocalPlayer.Character = nil 
    wait(.3)
    LocalPlayer.Character = ret 
    LocalPlayer.Character:Destroy()
    LocalPlayer.CharacterAdded:wait() 
    repeat wait() until LocalPlayer.Character.PrimaryPart ~= nil 
    LocalPlayer.Character:SetPrimaryPartCFrame(pos)
end)

AddCommand("hh", function()
	LocalPlayer.Character.Humanoid.HipHeight = args[2]
end)
--removes nicknames
local xNamingTbl = {}
AddCommand("nodpn", function()
	function clean(cplr)
		if cplr.DisplayName ~= cplr.Name then
			if cplr.Character then
				cplr.Character:WaitForChild("Humanoid").DisplayName = cplr.Name
			end
			cplr.CharacterAdded:Connect(function(char)
				LocalPlayer.Character:WaitForChild("Humanoid").DisplayName = "(NICKNAMED)\n"..cplr.Name
			end)
		end
	end
	local xNaming = game:GetService("Players").PlayerAdded:Connect(clean)
	for _, p in pairs(game:GetService("Players"):GetPlayers()) do
		clean(p)
	end
end)
AddCommand("fling",function()
	for _, Target in pairs(GetPlayer(args[2])) do
		local Root = game.Players.LocalPlayer.Character.HumanoidRootPart
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Part") then
				v.CanCollide = false
			end
		end
		local Spin = Instance.new("BodyAngularVelocity", LocalPlayer.Character.HumanoidRootPart)
		Spin.Name = "Spinning"
		Spin.AngularVelocity = Vector3.new(0, 120, 0)
		Spin.MaxTorque = Vector3.new(0, math.huge, 0)
		game:GetService("RunService").Heartbeat:Connect(function()
			Root.Velocity = Vector3.new(0,9e9,0)
			Root.CFrame = Target.Character.HumanoidRootPart.CFrame - Vector3.new(0,2.5,0) + Target.Character.HumanoidRootPart.Velocity/2
		end)
	end
end)
local following = false
AddCommand("stick",function()
	following = true
	for _, Target in pairs(GetPlayer(args[2])) do
		while following == true do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame= Target.Character.HumanoidRootPart.CFrame +  Target.Character.HumanoidRootPart.CFrame.lookVector * -1
			DeltaWait()
		end
	end
end)

AddCommand("unstick",function()
	following = false
end)
AddCommand("antifling",function()
	if antifling == nil then
		antifling = true
	else
		antifling = not antifling
	end
	local function Collisionless(person)
		if antifling and person.Character then
			for _, child in pairs(person.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide then
					child.CanCollide = false
				end
			end
		end
	end
	for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= lp then
			local antifling = game:GetService('RunService').RenderStepped:connect(function()
				Collisionless(v)
			end)
		end
	end
	game:GetService("Players").PlayerAdded:Connect(function()
		if v ~= lp and antifling then
			local antifling = game:GetService('RunService').Stepped:connect(function()
				Collisionless(v)
			end)
		end
	end)
	if antifling then

	else

	end
end)
end)
print(response)
