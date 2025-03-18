local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Ensure ChatEvent Exists
local chatEvent = ReplicatedStorage:FindFirstChild("ChatEvent")
if not chatEvent then
	chatEvent = Instance.new("RemoteEvent", ReplicatedStorage)
	chatEvent.Name = "ChatEvent"
end

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

-- Create Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 100)
Frame.Position = UDim2.new(0.5, -150, 0.8, -50)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Parent = ScreenGui

-- Create TextBox
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -10, 0.5, -5)
TextBox.Position = UDim2.new(0, 5, 0, 5)
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Text = "Type your message..."
TextBox.Parent = Frame

-- Create Send Button
local SendButton = Instance.new("TextButton")
SendButton.Size = UDim2.new(1, -10, 0.4, -5)
SendButton.Position = UDim2.new(0, 5, 0.6, 0)
SendButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SendButton.Text = "Send"
SendButton.Parent = Frame

-- Function to Send Chat Message
local function SendMessage()
	local Message = TextBox.Text
	if Message ~= "" and Message ~= "Type your message..." then
		if chatEvent then
			chatEvent:FireServer(Message)
			TextBox.Text = ""
		else
			warn("Chat event not found! Make sure a RemoteEvent named 'ChatEvent' exists in ReplicatedStorage.")
		end
	end
end

-- Connect Button Click
SendButton.MouseButton1Click:Connect(SendMessage)

-- Server-Side Script (Place in ServerScriptService)
if game:GetService("RunService"):IsServer() then
	chatEvent.OnServerEvent:Connect(function(player, message)
		local chatService = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
		if chatService then
			local sayMessageRequest = chatService:FindFirstChild("SayMessageRequest")
			if sayMessageRequest then
				sayMessageRequest:FireServer(message, "All") -- Sends message to the chat window
			else
				warn("SayMessageRequest not found! Ensure chat is enabled in game settings.")
			end
		else
			warn("DefaultChatSystemChatEvents not found! Ensure chat is enabled.")
		end
	end)
end


