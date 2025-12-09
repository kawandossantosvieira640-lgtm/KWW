repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local State = {
    AutoAttack = false
}

-- FUNÇÕES
local function GetEquippedTool()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChildOfClass("Tool")
end

local function Attack()
    local tool = GetEquippedTool()
    if tool then
        pcall(function()
            tool:Activate()
        end)
    end
end

-- GUI
local Gui = Instance.new("ScreenGui", game.CoreGui)

local Button = Instance.new("TextButton", Gui)
Button.Size = UDim2.new(0,180,0,50)
Button.Position = UDim2.new(0,20,0,200)
Button.Text = "AUTO ATTACK [OFF]"
Button.TextScaled = true
Button.BackgroundColor3 = Color3.fromRGB(40,40,40)
Button.TextColor3 = Color3.new(1,1,1)
Button.Active = true
Button.Draggable = true

Button.MouseButton1Click:Connect(function()
    State.AutoAttack = not State.AutoAttack
    Button.Text = State.AutoAttack and "AUTO ATTACK [ON]" or "AUTO ATTACK [OFF]"
end)

-- LOOP
task.spawn(function()
    while task.wait(0.15) do
        if State.AutoAttack then
            Attack()
        end
    end
end)

print("✅ Auto Attack Base carregado")
