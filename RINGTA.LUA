-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RINGTA BOND FARM"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Create the main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.9, 0, 0.9, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.BackgroundTransparency = 0
mainFrame.Parent = screenGui

-- Optional rounded corners
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.03, 0)
uiCorner.Parent = mainFrame

-- Top title text
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0.5, 0, 0.05, 0) -- Near the top (5% height)
titleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "RINGTA BOND FARM"
titleLabel.TextColor3 = Color3.fromRGB(0, 255, 127)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- Center text
local mainLabel = Instance.new("TextLabel")
mainLabel.Size = UDim2.new(1, 0, 0.2, 0)
mainLabel.Position = UDim2.new(0.5, 0, 0.25, 0) -- Slightly lower (25% height)
mainLabel.AnchorPoint = Vector2.new(0.5, 0.5)
mainLabel.BackgroundTransparency = 1
mainLabel.Text = "MADE BY RINGTA AND LUSHY LOVER"
mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
mainLabel.TextScaled = true
mainLabel.Font = Enum.Font.GothamBold
mainLabel.Parent = mainFrame

-- Discord link
local linkLabel = Instance.new("TextLabel")
linkLabel.Size = UDim2.new(1, 0, 0.1, 0)
linkLabel.Position = UDim2.new(0.5, 0, 0.5, 0) -- Middle of the frame (50% height)
linkLabel.AnchorPoint = Vector2.new(0.5, 0.5)
linkLabel.BackgroundTransparency = 1
linkLabel.Text = "https://discord.gg/ringta"
linkLabel.TextColor3 = Color3.fromRGB(180, 180, 255)
linkLabel.TextScaled = true
linkLabel.Font = Enum.Font.SourceSansBold
linkLabel.Parent = mainFrame

-- Dynamic text at 90% down
local dynamicLabel = Instance.new("TextLabel")
dynamicLabel.Size = UDim2.new(1, 0, 0.1, 0)
dynamicLabel.Position = UDim2.new(0.5, 0, 0.9, 0) -- Kept at original position
dynamicLabel.AnchorPoint = Vector2.new(0.5, 0.5)
dynamicLabel.BackgroundTransparency = 1
dynamicLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
dynamicLabel.TextScaled = true
dynamicLabel.Font = Enum.Font.GothamBold
dynamicLabel.Text = "Starting..." -- Initial text
dynamicLabel.Parent = mainFrame

-- New dynamic bonds collection text at 70% height
local bondsLabel = Instance.new("TextLabel")
bondsLabel.Size = UDim2.new(1, 0, 0.1, 0)
bondsLabel.Position = UDim2.new(0.5, 0, 0.7, 0) -- At 70% height
bondsLabel.AnchorPoint = Vector2.new(0.5, 0.5)
bondsLabel.BackgroundTransparency = 1
bondsLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
bondsLabel.TextScaled = true
bondsLabel.Font = Enum.Font.GothamBold
bondsLabel.Text = "" -- Start with no text
bondsLabel.Parent = mainFrame

-- Timer logic for dynamic text updates
task.spawn(function()
    dynamicLabel.Text = "Starting..." -- When executed
    wait(10)
    dynamicLabel.Text = "Collecting bonds data"
    wait(17) -- 10 + 17 = 27 seconds
    dynamicLabel.Text = "Collecting bonds now"
    wait(35) -- 27 + 35 = 62 seconds
    dynamicLabel.Text = "Restarting script"
end)

-- Timer logic for bonds collection with controlled pace and randomness
task.spawn(function()
    wait(28) -- Start updating bonds at 28 seconds
    local bonds = 1 -- Start from 1 bond
    local targetBonds = math.random(70, 90) -- Random target between 70 and 90 bonds
    local totalTime = 34 -- Total time to reach the target (seconds)
    local elapsed = 0 -- Track elapsed time
    while bonds < targetBonds and elapsed < totalTime do
        local increment = math.random(2, 5) -- Randomly increment by 2-5 bonds
        wait(totalTime / targetBonds) -- Proportional wait time per increment
        bonds = math.min(bonds + increment, targetBonds) -- Ensure bonds don’t exceed target
        bondsLabel.Text = tostring(bonds) .. " bonds being collected"
        elapsed = elapsed + (totalTime / targetBonds)
    end
    bondsLabel.Text = tostring(targetBonds) .. " bonds collected" -- Final result
end)
