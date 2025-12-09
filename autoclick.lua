repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local AutoAttack = false

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoAttackGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Button = Instance.new("TextButton")
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 180, 0, 50)
Button.Position = UDim2.new(0, 20, 0, 200)
Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.Text = "AUTO ATTACK: OFF"
Button.BorderSizePixel = 0
Button.Active = true
Button.Draggable = true

Button.MouseButton1Click:Connect(function()
    AutoAttack = not AutoAttack
    if AutoAttack then
        Button.Text = "AUTO ATTACK: ON"
        Button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        Button.Text = "AUTO ATTACK: OFF"
        Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    end
end)

-- AUTO ATTACK REAL
task.spawn(function()
    while task.wait(0.15) do
        if AutoAttack then
            local character = LocalPlayer.Character
            if character then
                local tool = character:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
            end
        end
    end
end)
