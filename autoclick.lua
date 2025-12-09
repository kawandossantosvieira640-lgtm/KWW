repeat task.wait() until game:IsLoaded()

local AutoClick = false

-- Serviço correto para simular clique
local VirtualUser = game:GetService("VirtualUser")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoClickGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Button = Instance.new("TextButton")
Button.Parent = ScreenGui
Button.Size = UDim2.new(0, 170, 0, 50)
Button.Position = UDim2.new(0, 20, 0, 200)
Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextScaled = true
Button.Text = "AUTO CLICK: OFF"
Button.BorderSizePixel = 0
Button.Active = true
Button.Draggable = true

Button.MouseButton1Click:Connect(function()
    AutoClick = not AutoClick
    if AutoClick then
        Button.Text = "AUTO CLICK: ON"
        Button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        Button.Text = "AUTO CLICK: OFF"
        Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    end
end)

-- AUTO CLICK REAL
task.spawn(function()
    while task.wait(0.1) do
        if AutoClick then
            VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(0.01)
            VirtualUser:Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end
    end
end)
