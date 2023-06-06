local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AdminMenuGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Name = "MenuFrame"
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Name = "TitleLabel"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.Text = "Admin Menu"
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 18
title.Parent = frame

local playerNameTextBox = Instance.new("TextBox")
playerNameTextBox.Name = "PlayerNameTextBox"
playerNameTextBox.PlaceholderText = "Enter player name"
playerNameTextBox.Position = UDim2.new(0.1, 0, 0, 50)
playerNameTextBox.Size = UDim2.new(0.8, 0, 0, 30)
playerNameTextBox.BackgroundTransparency = 0.5
playerNameTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerNameTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
playerNameTextBox.TextSize = 14
playerNameTextBox.Parent = frame

local function createButton(text, position, backgroundColor, callback)
    local button = Instance.new("TextButton")
    button.Name = text .. "Button"
    button.Position = position
    button.Size = UDim2.new(0.8, 0, 0, 40)
    button.AnchorPoint = Vector2.new(0.5, 0)
    button.BackgroundColor3 = backgroundColor
    button.BorderSizePixel = 0
    button.Font = Enum.Font.SourceSans
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 16
    button.Parent = frame

    button.MouseButton1Click:Connect(callback)

    return button
end

-- Function to view a player
local function viewPlayer()
    local playerName = playerNameTextBox.Text
    local player = game.Players:FindFirstChild(playerName)
    if player then
        print("Viewed player: " .. player.Name)
        game.Workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
    else
        print("Player not found!")
    end
end

-- Function to teleport a player
local function teleportPlayer()
    local playerName = playerNameTextBox.Text
    local player = game.Players:FindFirstChild(playerName)
    if player then
        print("Teleported player: " .. player.Name)
        game.Workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
    else
        print("Player not found!")
    end
end

-- Function to bring a player
local function bringPlayer()
    local playerName = playerNameTextBox.Text
    local player = game.Players:FindFirstChild(playerName)
    if player then
        print("Brought player: " .. player.Name)
        game.Workspace.Current Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
    else
        print("Player not found!")
    end
end

-- Function to kill a player
local function killPlayer()
    local playerName = playerNameTextBox.Text
    local player = game.Players:FindFirstChild(playerName)
    if player then
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
            print("Killed player: " .. player.Name)
        else
            print("Player has no humanoid!")
        end
    else
        print("Player not found!")
    end
end

createButton("View", UDim2.new(0.5, 0, 0.3, 0), Color3.fromRGB(0, 85, 255), viewPlayer)
createButton("Teleport", UDim2.new(0.5, 0, 0.45, 0), Color3.fromRGB(255, 170, 0), teleportPlayer)
createButton("Bring", UDim2.new(0.5, 0, 0.6, 0), Color3.fromRGB(0, 255, 85), bringPlayer)
createButton("Kill", UDim2.new(0.5, 0, 0.75, 0), Color3.fromRGB(255, 0, 0), killPlayer)
