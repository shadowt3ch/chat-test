local yapping = true


local Gaze = [[
Gaze Bypass Tutorial:
"https://youtube.com/shorts/z1yCdkbXTi4?si=f1ol4wCL4jxW3jtP"
]]

everyClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)



local GazerHa_Cooldown = 0.8





if not game:IsLoaded() then
    game.Loaded:wait()
end


    
local guiName = "GazeGayUIFemboySexLover"
local coreGay = cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")


if not coreGay:FindFirstChild(guiName) then
   
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = guiName  

    
    screenGui.Parent = coreGay

    print("•   Gaze bypass √ loaded.")
else
   
    print("•   Gaze bypass √ is already executed..")
    return
end



local function fadeTextThatMadeByChatGpt(labeltext)
    local screenGui = Instance.new("ScreenGui")
    local label = Instance.new("TextLabel") -- Corrected label variable name

    -- Set up the Sloves and Naggers properties
    screenGui.Parent = coreGay
    label.Parent = screenGui
    label.Size = UDim2.new(0.5, 0, 0.2, 0)  
    label.Position = UDim2.new(0.30, 0, 0.45, 0)  
    label.BackgroundTransparency = 1
    label.TextTransparency = 1
    label.Text = labeltext
    label.TextColor3 = Color3.new(0, 1, 1)  
    label.TextScaled = true
    label.Font = Enum.Font.GothamBlack -- Bold, modern font

    
    local fadeDuration = GazerHa_Cooldown

    
    local tweenService = game:GetService("TweenService")

    
    local fadeIn = tweenService:Create(label, TweenInfo.new(fadeDuration), {TextTransparency = 0})
    fadeIn:Play()
    fadeIn.Completed:Wait()

    task.wait(fadeDuration)

    
    local fadeOut = tweenService:Create(label, TweenInfo.new(fadeDuration), {TextTransparency = 1})
    fadeOut:Play()
    fadeOut.Completed:Wait()

    screenGui:Destroy()
end

if yapping then

fadeTextThatMadeByChatGpt("Made By GazerHa")
fadeTextThatMadeByChatGpt("ROBLOX STOP PATCHING MY OPEN SOURCED SCRIPT \u{1F62D}")
fadeTextThatMadeByChatGpt("Unpatched, but its not good as before.")

fadeTextThatMadeByChatGpt("TO MAKE THE BYPASS WORK\nRead Your Clipboard")

everyClipboard(tostring(Gaze))
task.wait(0.5)


fadeTextThatMadeByChatGpt("READ THE TUTORIAL ON YOUR COPY")
end









-- here



local function isEmoji(c)
    local code = utf8.codepoint(c)  

    
    if (code >= 0x1F600 and code <= 0x1F64F) or  
       (code >= 0x1F300 and code <= 0x1F5FF) or  
       (code >= 0x1F680 and code <= 0x1F6FF) or  
       (code >= 0x1F700 and code <= 0x1F77F) or  
       (code >= 0x1F900 and code <= 0x1F9FF) or  
       (code >= 0x2600 and code <= 0x26FF) or    
       (code >= 0x2700 and code <= 0x27BF) or    
       (code >= 0x1F1E6 and code <= 0x1F1FF) then 
        return true  
    end
    return false  
end




local function Bypass(input)

if not string.find(input, " ") then
        input = ">\b" .. input
    end
    
local replacements = {
   Rape = “•尺卂 ρ乇”,
        ass = "•AƧƧ",
        Ass = "ΛƧƧ",
        ASS = "AƧƧ",
        fuck = "f••••••u•c•k•",
        Fuck = "F••••••u•c•k•",
        FUCK = "F••••••U•C•K•",
        damn = "đамп",
        Damn = "•đамп",
        DAMN = "•đамп",
        sex = "s••.e••x",
        Sex = "S••.••e••x",
       SEX = "S.••E••X",
        shit = "•s••••••h•i•t•",
        Shit = "•S••••••h•i•t•",
        SHIT = "•S••••••H•I•T•",
        pornhub = "•p.••••••o•r•n•••h.•••ub•",
        Pornhub = "•P.••••••o•r•n•••h.•••ub•",
        porn = "•p.••••••o•r•n•",
        Porn = "•P.••••••o•r•n•",
        PORN = "•P.••••••O•R•N•",
        bitch = "•b•.i•t•••c•h•",
        Bitch = "•B.•i•t•••c•h•",
        BITCH = "•вгтсн",
        nigga = "n•##.•••g•a",
        nigger = "n•##.•••g•e•r••",
        Nigga = "ภเﻮﻮa",
        NIGG
        NIGGAS = "ภเﻮﻮas",
        NIGGA = "ภเﻮﻮa",
        dick = "ďiсж",
        Cock = "C••••••o.•c•k•",
        COCK = "C••••••O.•C•K•",
        gay = "g••••••a•y",
        Gay = "G••••••a•y",
        GAY = "GAY",
        pussy = "p••••u•s.•s••••••y••",
        Pussy = "P••••u•s.•s••••••y••",
        PUSSY = "P•USAY",
        breast = "•b•r••••••.e•a•s•t•",
        Breast = "•B•r••••••.e•a•s•t•",
        BREAST ="•B•R••••••.E•A•S•T•",
        Kkk = "Kƙׁׅ֑ƙׁׅ֑",
        Hawk tuah = “нawk-тuан”,
        ["0"] = "\xEF\xBC\x90",
["1"] = "\xEF\xBC\x91",
["2"] = "\xEF\xBC\x92",  
["3"] = "\xEF\xBC\x93",  
["4"] = "\xEF\xBC\x94",  
["5"] = "\xEF\xBC\x95",  
["6"] = "\xEF\xBC\x96", 
["7"] = "\xEF\xBC\x97", 
["8"] = "\xEF\xBC\x98",  
["9"] = "\xEF\xBC\x99",  
}

    local lowerInput = input:lower()

    
    for word, replacement in pairs(replacements) do
        lowerInput = lowerInput:gsub("(%s?)(" .. word .. ")(%s?)", function(before, matched, after)
            local modifiedReplacement = replacement
            if before ~= "" then
                modifiedReplacement = modifiedReplacement
            end
            if after ~= "" then
                modifiedReplacement = modifiedReplacement
            end
            return before .. "{" .. modifiedReplacement .. "}" .. after
        end)
    end

    
    local emojiPattern = "[%z\1-\127\194-\244][\128-\191]*"
    local modifiedInput = lowerInput:gsub(emojiPattern, function(c)
        if isEmoji(c) then
            return "{" .. c .. "}"
        end
        return c
    end)

    
    local result = ""
    local insideReplacedWord = false

    for i = 1, #modifiedInput do
        local char = modifiedInput:sub(i, i)

        if char == "{" then
            insideReplacedWord = true
        elseif char == "}" then
            insideReplacedWord = false
        elseif insideReplacedWord then
            result = result .. char
        elseif char == " " then
        result = result .. "\b"
    
        else
            result = result .. char
            
            if i < #modifiedInput and i % 3 == 1 then
    result = result .. ""

            end
        end
    end

    
    result = result:gsub("{", ""):gsub("}", "")
        result = result:gsub("•", "\u{0327}")
    result = result:gsub("I", "ℹ")
    result = result:gsub("|", "\r")

    
    result = result:gsub("\u{0327}", "") --[[Remove Again LOLLLL 
              (Get some furry fandom for ur work roblox)
                   stepid facebook stalker #ss n**ga gr*y nerdyass delta f*ck"r]]
    
    

    
    local A_1 = result
    local A_2 = "All"

    if game:GetService("TextChatService"):FindFirstChild("TextChannels") then
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(A_1)
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer( A_1, A_2)
    end
end
    

    
    
    






local gui = Instance.new("ScreenGui")
local GazerMain = Instance.new("Frame")
local GazerTitle = Instance.new("TextLabel")
local TextBax = Instance.new("TextBox")
local chat = Instance.new("TextButton")


gui.Name = "Gyst bypasser"
gui.Parent = coreGay
GazerMain.Size = UDim2.new(0.5, 0, 0.5, 0)
GazerMain.Position = UDim2.new(0.25, 0, 0.25, 0)
GazerMain.BackgroundColor3 = Color3.new(1, 1, 1)
GazerMain.BorderColor3 = Color3.new(0, 0, 0)
GazerMain.BorderSizePixel = 1
GazerMain.Active = true
GazerMain.Draggable = true
GazerMain.Parent = gui
GazerTitle.Size = UDim2.new(1, 0, 0.2, 0)
GazerTitle.Position = UDim2.new(0, 0, 0, 0)
GazerTitle.BackgroundColor3 = Color3.new(0, 0, 0)
GazerTitle.BorderColor3 = Color3.new(0, 0, 0)
GazerTitle.BorderSizePixel = 1
GazerTitle.Text = "Gaze Bypass (Tutorial needed)"
GazerTitle.TextSize = 14
GazerTitle.TextColor3 = Color3.new(1, 1, 1)
GazerTitle.Font = Enum.Font.Bodoni
GazerTitle.Parent = GazerMain
TextBax.Size = UDim2.new(0.8, 0, 0.2, 0)
TextBax.Position = UDim2.new(0.1, 0, 0.3, 0)
TextBax.BackgroundColor3 = Color3.new(0, 0, 0)
TextBax.BorderColor3 = Color3.new(0, 0, 0)
TextBax.BorderSizePixel = 1
TextBax.PlaceholderText = "(Chat)"
TextBax.TextColor3 = Color3.new(1, 1, 1)
TextBax.Font = Enum.Font.Code
TextBax.Text = ""
TextBax.TextSize = 15
TextBax.Parent = GazerMain
chat.Size = UDim2.new(0.3, 0, 0.2, 0)
chat.Position = UDim2.new(0.35, 0, 0.7, 0)
chat.BackgroundColor3 = Color3.new(0, 0, 0)
chat.BorderColor3 = Color3.new(0, 0, 0)
chat.BorderSizePixel = 1
chat.Text = "Chat"
chat.TextSize = 14
chat.TextColor3 = Color3.new(1, 1, 1)
chat.Font = Enum.Font.Code
chat.Parent = GazerMain







chat.MouseButton1Click:Connect(function()
    local inputString = TextBax.Text
    Bypass(inputString)
    
end)


-- Credits: darkpheniox3.

pcall(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/1price/usercreation/refs/heads/main/workspace/ACL%20-%20legacy.lua'))()
end)
