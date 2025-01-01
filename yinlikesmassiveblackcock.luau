-- URL to fetch usernames from
local url = "https://raw.githubusercontent.com/n0raxd/the-sweat-list/refs/heads/main/sweats"
local usernames = {}

-- Function to get usernames from the URL
local function updateUsernames()
    local response = game:HttpGet(url)
    usernames = {}
    for username in response:gmatch("[^\r\n]+") do
        table.insert(usernames, username)
    end
    print("Usernames updated.")
end

-- Initial fetch of usernames
updateUsernames()

-- Re-fetch usernames every minute
local RunService = game:GetService("RunService")
RunService.Stepped:Connect(function(time, deltaTime)
    if math.floor(time % 60) == 0 then
        updateUsernames()
        checkPlayers(usernames)
    end
end)

-- Check if a player in the game matches any username from the list
local function checkPlayers(usernames)
    for _, player in ipairs(game.Players:GetPlayers()) do
        for _, username in ipairs(usernames) do
            if player.Name == username then
                -- shitty game security lmfao
local function findGearMachineKeypads()
    local keypads = {}

    -- Recursive function to search within services or models
    local function search(container)
        for _, object in ipairs(container:GetChildren()) do
            if object:IsA("Model") and object.Name == "Gear Machine" then
                local keypad = object:FindFirstChild("Keypad") -- Adjust "Keypad" if needed
                if keypad then
                    table.insert(keypads, keypad)
                end
            end

            if object:IsA("Model") or object:IsA("Folder") then
                search(object)
            end
        end
    end

    -- Search relevant containers
    search(game.Workspace)
    return keypads
end

-- Get all keypads from Gear Machines
local foundKeypads = findGearMachineKeypads()

-- Print and store keypads globally for debugging purposes
for index, keypad in ipairs(foundKeypads) do
    _G["keypad" .. index] = keypad
    print("keypad" .. index .. ": " .. keypad:GetFullName())
end

-- Variable to keep track of the current keypad being processed
local currentKeypad

-- Function to simulate typing on the keypad
function typegear(inputValue)
    if not currentKeypad then
        warn("No keypad selected.")
        return
    end

    for i = 1, #inputValue do
        local buttonName = inputValue:sub(i, i) -- Extract each character
        local button = currentKeypad:FindFirstChild(buttonName) -- Find the button by name

        if button then
            local clickDetector = button:FindFirstChild("RangeC") -- Adjust "RangeC" if needed

            if clickDetector then
                fireclickdetector(clickDetector) -- Fire the click detector
                print("Clicked button '" .. buttonName .. "' on keypad: " .. currentKeypad.Name)
            else
                warn("Click detector 'RangeC' not found in button " .. buttonName)
            end
        else
            warn("Button named '" .. buttonName .. "' not found in the keypad.")
        end
    end
end

-- Process all keypads found
for _, keypad in ipairs(foundKeypads) do
    currentKeypad = keypad -- Set the current keypad
    fireclickdetector(keypad:FindFirstChild("Clear"):FindFirstChild("RangeC"))
    typegear("6418277837") -- Example input sequence, replace with your own
end

RunService.Heartbeat:Connect(function()
    for _, keypad in ipairs(foundKeypads) do
        fireclickdetector(keypad:FindFirstChild("Enter"):FindFirstChild("RangeC"))
    end
end)
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomTextGui"
screenGui.Parent = playerGui

-- Create TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Parent = screenGui
textLabel.Size = UDim2.new(1, 0, 0.1, 0)  -- Full width, 10% height
textLabel.Position = UDim2.new(0, 0, 0, 0)  -- Top of the screen
textLabel.BackgroundTransparency = 1  -- No background
textLabel.Text = ".gg/getluna"
textLabel.TextSize = 30  -- Large text size
textLabel.Font = Enum.Font.SourceSansBold  -- Bold font
textLabel.TextStrokeTransparency = 0.5  -- Soft stroke for readability

-- RGB Effect
local tweenService = game:GetService("TweenService")
local colors = {Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255)}
local index = 1

while true do
    local nextColor = colors[index]
    index = index % #colors + 1
    local tween = tweenService:Create(textLabel, TweenInfo.new(0.5), {TextColor3 = nextColor})
    tween:Play()
    tween.Completed:Wait()
    wait(0.1)
end

            end
        end
    end
end

-- Monitor player joins and check for matching usernames
game.Players.PlayerAdded:Connect(function(player)
    for _, username in ipairs(usernames) do
        if player.Name == username then
           -- shitty game security lmfao
local function findGearMachineKeypads()
    local keypads = {}

    -- Recursive function to search within services or models
    local function search(container)
        for _, object in ipairs(container:GetChildren()) do
            if object:IsA("Model") and object.Name == "Gear Machine" then
                local keypad = object:FindFirstChild("Keypad") -- Adjust "Keypad" if needed
                if keypad then
                    table.insert(keypads, keypad)
                end
            end

            if object:IsA("Model") or object:IsA("Folder") then
                search(object)
            end
        end
    end

    -- Search relevant containers
    search(game.Workspace)

    return keypads
end

-- Get all keypads from Gear Machines
local foundKeypads = findGearMachineKeypads()

-- Print and store keypads globally for debugging purposes
for index, keypad in ipairs(foundKeypads) do
    _G["keypad" .. index] = keypad
    print("keypad" .. index .. ": " .. keypad:GetFullName())
end

-- Process all keypads found
for _, keypad in ipairs(foundKeypads) do
    currentKeypad = keypad -- Set the current keypad
    fireclickdetector(keypad:FindFirstChild("Clear"):FindFirstChild("RangeC"))
    typegear("6418277837") -- Example input sequence, replace with your own
end

RunService.Heartbeat:Connect(function()
    for _, keypad in ipairs(foundKeypads) do
        fireclickdetector(keypad:FindFirstChild("Enter"):FindFirstChild("RangeC"))
    end
end)
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomTextGui"
screenGui.Parent = playerGui

-- Create TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Parent = screenGui
textLabel.Size = UDim2.new(1, 0, 0.1, 0)  -- Full width, 10% height
textLabel.Position = UDim2.new(0, 0, 0, 0)  -- Top of the screen
textLabel.BackgroundTransparency = 1  -- No background
textLabel.Text = ".gg/getluna"
textLabel.TextSize = 30  -- Large text size
textLabel.Font = Enum.Font.SourceSansBold  -- Bold font
textLabel.TextStrokeTransparency = 0.5  -- Soft stroke for readability

-- RGB Effect
local tweenService = game:GetService("TweenService")
local colors = {Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255)}
local index = 1

while true do
    local nextColor = colors[index]
    index = index % #colors + 1
    local tween = tweenService:Create(textLabel, TweenInfo.new(0.5), {TextColor3 = nextColor})
    tween:Play()
    tween.Completed:Wait()
    wait(0.1)
end

        end
    end
end)

-- Check current players already in the game
checkPlayers(usernames)
