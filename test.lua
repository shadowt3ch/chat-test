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

-- Fade text function
local function fadeText(text)
	local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui", 5)
	if not playerGui then
		warn("PlayerGui not found for fade text!")
		return
	end

	local screenGui = Instance.new("ScreenGui")
	local label = Instance.new("TextLabel")
	screenGui.Parent = playerGui
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
	fadeText("Made By ShadowT3ch")
	if everyClipboard then 
		everyClipboard(Gaze)
		print("Clipboard set with tutorial link.")
	else
		print("Clipboard function unavailable.")
	end
	task.wait(0.5)
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

-- Main UI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local URLLabel = Instance.new("TextLabel")
local TabFrame = Instance.new("Frame")
local TitleAccent = Instance.new("Frame")
local TabAccent = Instance.new("Frame")

-- Parent to PlayerGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
print("ScreenGui created and parented to PlayerGui.")

-- Main Frame Properties
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
print("Main frame created.")

-- Title Bar
TitleBar.Parent = MainFrame
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

-- Title Accent Line
TitleAccent.Parent = TitleBar
TitleAccent.Size = UDim2.new(1, 0, 0, 2)
TitleAccent.Position = UDim2.new(0, 0, 1, -2)
TitleAccent.BackgroundColor3 = Color3.fromRGB(138, 43, 226)

-- Title
Title.Parent = TitleBar
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0, 5, 0, 0)
Title.Text = "Gyst Bypasser V3 BETA  |  Delta"
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
print("Title label created.")

-- URL Label
URLLabel.Parent = TitleBar
URLLabel.Size = UDim2.new(0.3, -5, 1, 0)
URLLabel.Position = UDim2.new(0.7, 0, 0, 0)
URLLabel.Text = "URL: gyst.shadowt3ch.site"
URLLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
URLLabel.Font = Enum.Font.Gotham
URLLabel.TextSize = 12
URLLabel.BackgroundTransparency = 1
URLLabel.TextXAlignment = Enum.TextXAlignment.Right

-- Tab Frame
TabFrame.Parent = MainFrame
TabFrame.Size = UDim2.new(1, 0, 0, 30)
TabFrame.Position = UDim2.new(0, 0, 0, 30)
TabFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

-- Tab Accent Line
TabAccent.Parent = TabFrame
TabAccent.Size = UDim2.new(1, 0, 0, 2)
TabAccent.Position = UDim2.new(0, 0, 1, -2)
TabAccent.BackgroundColor3 = Color3.fromRGB(138, 43, 226)

-- Tabs Setup (Main, PresetWords, and Say)
local Tabs = {"Main", "PresetWords", "Say"}
local ContentFrames = {}
for i, tabName in ipairs(Tabs) do
	local TabButton = Instance.new("TextButton")
	TabButton.Parent = TabFrame
	TabButton.Size = UDim2.new(0.33, -2, 1, 0)
	TabButton.Position = UDim2.new((i - 1) * 0.33, 0, 0, 0)
	TabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	TabButton.Text = tabName
	TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
	TabButton.Font = Enum.Font.Gotham
	TabButton.TextSize = 12

	-- Hover Effect
	TabButton.MouseEnter:Connect(function()
		TabButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
	end)
	TabButton.MouseLeave:Connect(function()
		TabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	end)

	-- Content Frames
	local ContentFrame = Instance.new("Frame")
	ContentFrame.Parent = MainFrame
	ContentFrame.Size = UDim2.new(1, 0, 1, -60)
	ContentFrame.Position = UDim2.new(0, 0, 0, 60)
	ContentFrame.BackgroundTransparency = 1
	ContentFrame.Visible = (i == 1)
	ContentFrames[tabName] = ContentFrame

	-- Tab Switching
	TabButton.MouseButton1Click:Connect(function()
		for _, frame in pairs(ContentFrames) do
			frame.Visible = false
		end
		ContentFrame.Visible = true
	end)
end

-- Add Content for Each Tab
local function createTabContent(tabName, ContentFrame)
	if tabName == "Main" then
		local mainFrame = Instance.new("Frame")
		mainFrame.Parent = ContentFrame
		mainFrame.Size = UDim2.new(1, 0, 1, 0)
		mainFrame.BackgroundTransparency = 1

		local welcomeLabel = Instance.new("TextLabel")
		welcomeLabel.Parent = mainFrame
		welcomeLabel.Size = UDim2.new(1, 0, 0.1, 0)
		welcomeLabel.Position = UDim2.new(0, 0, 0, 0)
		welcomeLabel.Text = "Welcome to the Gyst Bypasser V3 Beta!"
		welcomeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		welcomeLabel.Font = Enum.Font.GothamBold
		welcomeLabel.TextSize = 20
		welcomeLabel.BackgroundTransparency = 1
		welcomeLabel.TextXAlignment = Enum.TextXAlignment.Center

		local statusLabel = Instance.new("TextLabel")
		statusLabel.Parent = mainFrame
		statusLabel.Size = UDim2.new(1, 0, 0.08, 0)
		statusLabel.Position = UDim2.new(0, 0, 0.1, 0)
		statusLabel.Text = "Status: BETA"
		statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
		statusLabel.Font = Enum.Font.Gotham
		statusLabel.TextSize = 16
		statusLabel.BackgroundTransparency = 1
		statusLabel.TextXAlignment = Enum.TextXAlignment.Center

		local updatesTitle = Instance.new("TextLabel")
		updatesTitle.Parent = mainFrame
		updatesTitle.Size = UDim2.new(1, 0, 0.06, 0)
		updatesTitle.Position = UDim2.new(0, 0, 0.2, 0)
		updatesTitle.Text = "Latest Updates:"
		updatesTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
		updatesTitle.Font = Enum.Font.GothamBold
		updatesTitle.TextSize = 18
		updatesTitle.BackgroundTransparency = 1
		updatesTitle.TextXAlignment = Enum.TextXAlignment.Center

		local updatesText = Instance.new("TextLabel")
		updatesText.Parent = mainFrame
		updatesText.Size = UDim2.new(1, 0, 0.12, 0)
		updatesText.Position = UDim2.new(0, 0, 0.26, 0)
		updatesText.Text = "- Bug fixes\n- Improved UI\n- Added new words!"
		updatesText.TextColor3 = Color3.fromRGB(200, 200, 200)
		updatesText.Font = Enum.Font.Gotham
		updatesText.TextSize = 14
		updatesText.BackgroundTransparency = 1
		updatesText.TextXAlignment = Enum.TextXAlignment.Center

		local creditsTitle = Instance.new("TextLabel")
		creditsTitle.Parent = mainFrame
		creditsTitle.Size = UDim2.new(1, 0, 0.06, 0)
		creditsTitle.Position = UDim2.new(0, 0, 0.4, 0)
		creditsTitle.Text = "Credits:"
		creditsTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
		creditsTitle.Font = Enum.Font.GothamBold
		creditsTitle.TextSize = 18
		creditsTitle.BackgroundTransparency = 1
		creditsTitle.TextXAlignment = Enum.TextXAlignment.Center

		local creditsText = Instance.new("TextLabel")
		creditsText.Parent = mainFrame
		creditsText.Size = UDim2.new(1, 0, 0.12, 0)
		creditsText.Position = UDim2.new(0, 0, 0.46, 0)
		creditsText.Text = "ShadowT3ch Development Team\nBeta Testers"
		creditsText.TextColor3 = Color3.fromRGB(200, 200, 200)
		creditsText.Font = Enum.Font.Gotham
		creditsText.TextSize = 14
		creditsText.BackgroundTransparency = 1
		creditsText.TextXAlignment = Enum.TextXAlignment.Center
	elseif tabName == "PresetWords" then
		local playerFrame = Instance.new("Frame")
		playerFrame.Parent = ContentFrame
		playerFrame.Size = UDim2.new(1, 0, 1, 0)
		playerFrame.BackgroundTransparency = 1

		local bypassWords = {
			"ыасk", "шiне", "Sтгu", "иiзза", "вгтсн", "нawk-тuан",
			"Freaky as𝗴 boy 💀", "моммγ", "הrםק"
		}

		local gridLayout = Instance.new("UIGridLayout")
		gridLayout.Parent = playerFrame
		gridLayout.CellSize = UDim2.new(0, 200, 0, 30)
		gridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
		gridLayout.FillDirection = Enum.FillDirection.Horizontal
		gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		gridLayout.VerticalAlignment = Enum.VerticalAlignment.Top

		for _, word in ipairs(bypassWords) do
			local button = Instance.new("TextButton")
			button.Size = UDim2.new(0, 200, 0, 30)
			button.Text = word
			button.TextSize = 14
			button.TextColor3 = Color3.fromRGB(255, 255, 255)
			button.BackgroundTransparency = 1
			button.Font = Enum.Font.Gotham
			button.Parent = playerFrame
			button.TextStrokeTransparency = 0.8
			button.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

			button.MouseEnter:Connect(function()
				game:GetService("TweenService"):Create(
					button, 
					TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 
					{TextColor3 = Color3.fromRGB(138, 43, 226)}
				):Play()
			end)

			button.MouseLeave:Connect(function()
				game:GetService("TweenService"):Create(
					button, 
					TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 
					{TextColor3 = Color3.fromRGB(255, 255, 255)}
				):Play()
			end)

			button.MouseButton1Click:Connect(function()
				bypass(word) -- Use the bypass function instead of Chat service
				local originalSize = button.Size
				game:GetService("TweenService"):Create(
					button, 
					TweenInfo.new(0.1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), 
					{Size = UDim2.new(0, 190, 0, 28)}
				):Play()
				task.wait(0.1)
				game:GetService("TweenService"):Create(
					button, 
					TweenInfo.new(0.1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), 
					{Size = originalSize}
				):Play()
			end)
		end
	elseif tabName == "Say" then
		local searchFrame = Instance.new("Frame")
		searchFrame.Parent = ContentFrame
		searchFrame.Size = UDim2.new(1, 0, 1, 0)
		searchFrame.BackgroundTransparency = 1

		local SearchBox = Instance.new("TextBox")
		SearchBox.Size = UDim2.new(1, -10, 1, -10)
		SearchBox.Position = UDim2.new(0, 5, 0, 5)
		SearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		SearchBox.PlaceholderText = "Type what you want to say..."
		SearchBox.Font = Enum.Font.SourceSans
		SearchBox.TextSize = 18
		SearchBox.ClearTextOnFocus = false
		SearchBox.Text = ""
		SearchBox.Parent = searchFrame

		local UICorner2 = Instance.new("UICorner")
		UICorner2.CornerRadius = UDim.new(0, 6)
		UICorner2.Parent = SearchBox

		local function sendMessage()
			local message = SearchBox.Text
			if message ~= "" then
				bypass(message) -- Use the bypass function
				SearchBox.Text = ""
			end
		end

		SearchBox.FocusLost:Connect(function(enterPressed)
			if enterPressed then
				sendMessage()
			end
		end)
	end
end

-- Create content for tabs
createTabContent("Main", ContentFrames["Main"])
createTabContent("PresetWords", ContentFrames["PresetWords"])
createTabContent("Say", ContentFrames["Say"])

print("GUI setup complete. Check in-game!")
