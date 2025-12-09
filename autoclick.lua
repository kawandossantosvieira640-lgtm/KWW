repeat task.wait() until game:IsLoaded()

-- SERVICES
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

-- STATES
local State = {
    AutoAttack = false,
    AutoFarmBoss = false,
    AutoSeaMonster = false,
    AutoHop = false,
    SelectedBoss = nil
}

-- GUI
local Gui = Instance.new("ScreenGui")
Gui.Name = "KL_HUB"
Gui.ResetOnSpawn = false
Gui.Parent = game.CoreGui

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 340, 0, 360)
Main.Position = UDim2.new(0.03, 0, 0.2, 0)
Main.BackgroundColor3 = Color3.fromRGB(25,25,25)
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,0,0,40)
Title.Text = "KING LEGACY HUB"
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundColor3 = Color3.fromRGB(15,15,15)
Title.TextScaled = true

-- BUTTON FACTORY
local function CreateButton(text, y, callback)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9,0,0,40)
    btn.Position = UDim2.new(0.05,0,0,y)
    btn.Text = text
    btn.TextScaled = true
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- BUTTONS
CreateButton("Auto Attack [OFF]", 60, function(self)
    State.AutoAttack = not State.AutoAttack
end)

CreateButton("Auto Farm Boss [OFF]", 110, function()
    State.AutoFarmBoss = not State.AutoFarmBoss
end)

CreateButton("Auto Sea Monster [OFF]", 160, function()
    State.AutoSeaMonster = not State.AutoSeaMonster
end)

CreateButton("Auto Hop Server [OFF]", 210, function()
    State.AutoHop = not State.AutoHop
end)

CreateButton("Selecionar Boss: NONE", 260, function()
    -- Aqui entra dropdown real futuramente
    State.SelectedBoss = "Sea King"
end)

-- SYSTEM LOOPS (BASE)
task.spawn(function()
    while task.wait(0.2) do
        if State.AutoAttack then
            -- 🔒 Aqui entram calls reais (Tool / RemoteEvent)
        end

        if State.AutoFarmBoss and State.SelectedBoss then
            -- 🔒 Scan + farm boss
        end

        if State.AutoSeaMonster then
            -- 🔒 Sea monster logic
        end

        if State.AutoHop then
            -- 🔒 Server hop logic real
        end
    end
end)

print("✅ King Legacy Hub Base carregado")
