local yapping = true
local Gaze = "Gaze Bypass Tutorial: https://youtube.com/shorts/z1yCdkbXTi4?si=f1ol4wCL4jxW3jtP"
local GazerHa_Cooldown = 0.8

-- Clipboard function compatibility
local everyClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

-- Wait for game to load
if not game:IsLoaded() then
	print("Waiting for game to load...")
	game.Loaded:Wait()
end

-- Fade text function (optional CoreGui usage)
local function fadeText(text)
	local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui", 5)
	if not playerGui then
		warn("PlayerGui not found for fade text!")
		return
	end

	local screenGui = Instance.new("ScreenGui")
	local label = Instance.new("TextLabel")
	screenGui.Parent = playerGui -- Changed from CoreGui to PlayerGui
	label.Parent = screenGui
	label.Size = UDim2.new(0.5, 0, 0.2, 0)
	label.Position = UDim2.new(0.3, 0, 0.45, 0)
	label.BackgroundTransparency = 1
	label.TextTransparency = 1
	label.Text = text
	label.TextColor3 = Color3.new(0, 1, 1)
	label.TextScaled = true
	label.Font = Enum.Font.GothamBlack

	local tweenService = game:GetService("TweenService")
	local fadeIn = tweenService:Create(label, TweenInfo.new(GazerHa_Cooldown), {TextTransparency = 0})
	fadeIn:Play()
	fadeIn.Completed:Wait()
	task.wait(GazerHa_Cooldown)
	local fadeOut = tweenService:Create(label, TweenInfo.new(GazerHa_Cooldown), {TextTransparency = 1})
	fadeOut:Play()
	fadeOut.Completed:Wait()
	screenGui:Destroy()
end

-- Initial messages
if yapping then
	fadeText("Made By GazerHa")
	fadeText("ROBLOX STOP PATCHING MY OPEN SOURCED SCRIPT 😭")
	fadeText("Unpatched, but not as good as before.")
	fadeText("TO MAKE THE BYPASS WORK\nRead Your Clipboard")
	if everyClipboard then 
		everyClipboard(Gaze)
		print("Clipboard set with tutorial link.")
	else
		print("Clipboard function unavailable.")
	end
	task.wait(0.5)
	fadeText("READ THE TUTORIAL ON YOUR COPY")
end

-- Bypass function
local function bypass(input)
	if not input:find(" ") then input = ">" .. input end

	local replacements = {
		["rape"] = "尺卂ρ乇",
		["ass"] = "AƧƧ",
		["fuck"] = "fυcк",
		["damn"] = "đамп",
		["sex"] = "sεx",
		["shit"] = "sнιт",
		["pornhub"] = "ρoяиhυв",
		["porn"] = "ρoяи",
		["bitch"] = "вιтch",
		["nigga"] = "иιgga",
		["nigger"] = "иιggeя",
		["dick"] = "đιcк",
		["cock"] = "cσcк",
		["gay"] = "gαy",
		["pussy"] = "ρυssy",
		["breast"] = "вяεasт",
		["kkk"] = "Kƙƙ",
		["hawk tuah"] = "нawктυaн"
	}

	local lowerInput = input:lower()
	for word, replacement in pairs(replacements) do
		lowerInput = lowerInput:gsub(word, "{" .. replacement .. "}")
	end

	local result = ""
	local insideReplaced = false
	for i = 1, #lowerInput do
		local char = lowerInput:sub(i, i)
		if char == "{" then
			insideReplaced = true
		elseif char == "}" then
			insideReplaced = false
		elseif insideReplaced then
			result = result .. char
		else
			result = result .. char
			if i % 3 == 0 and i < #lowerInput then
				result = result .. "\u{200B}"
			end
		end
	end

	result = result:gsub("{", ""):gsub("}", "")

	local textChatService = game:GetService("TextChatService")
	if textChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		local channel = textChatService:FindFirstChild("TextChannels") and textChatService.TextChannels:FindFirstChild("RBXGeneral")
		if channel then
			channel:SendAsync(result)
			print("Message sent via TextChatService: " .. result)
		else
			print("RBXGeneral channel not found.")
		end
	else
		local chatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
		if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
			chatEvents.SayMessageRequest:FireServer(result, "All")
			print("Message sent via legacy chat: " .. result)
		else
			print("Legacy chat system not found.")
		end
	end
end

-- GUI setup using ScreenGui in PlayerGui
print("Attempting to create GUI...")
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui", 5)
if not playerGui then
	warn("PlayerGui not found! Script cannot proceed.")
	return
end

local gui = Instance.new("ScreenGui")
gui.Name = "GystBypasser"
gui.ResetOnSpawn = false
gui.Parent = playerGui
print("ScreenGui 'GystBypasser' created and parented to PlayerGui.")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
mainFrame.BorderColor3 = Color3.new(0, 0, 0)
mainFrame.BorderSizePixel = 1
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui
print("Main frame created.")

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.2, 0)
title.BackgroundColor3 = Color3.new(0, 0, 0)
title.BorderColor3 = Color3.new(0, 0, 0)
title.Text = "Gaze Bypass (Tutorial needed)"
title.TextSize = 14
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.Bodoni
title.Parent = mainFrame
print("Title label created.")

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0.2, 0)
textBox.Position = UDim2.new(0.1, 0, 0.3, 0)
textBox.BackgroundColor3 = Color3.new(0, 0, 0)
textBox.BorderColor3 = Color3.new(0, 0, 0)
textBox.PlaceholderText = "(Chat)"
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.Font = Enum.Font.Code
textBox.Text = ""
textBox.TextSize = 15
textBox.Parent = mainFrame
print("TextBox created.")

local chatButton = Instance.new("TextButton")
chatButton.Size = UDim2.new(0.3, 0, 0.2, 0)
chatButton.Position = UDim2.new(0.35, 0, 0.7, 0)
chatButton.BackgroundColor3 = Color3.new(0, 0, 0)
chatButton.BorderColor3 = Color3.new(0, 0, 0)
chatButton.Text = "Chat"
chatButton.TextSize = 14
chatButton.TextColor3 = Color3.new(1, 1, 1)
chatButton.Font = Enum.Font.Code
chatButton.Parent = mainFrame
print("Chat button created.")

chatButton.MouseButton1Click:Connect(function()
	print("Chat button clicked. Input: " .. textBox.Text)
	bypass(textBox.Text)
end)

print("GUI setup complete. Check in-game!")
