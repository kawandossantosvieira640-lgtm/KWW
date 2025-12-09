repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local State = {
    AutoAttack = false,
    AutoFarmBoss = false,
    AutoSeaMonster = false,
    AutoHop = false,
    SelectedBoss = "None"
}

-- GUI
local Gui = Instance.new("ScreenGui", game.CoreGui)
Gui.Name = "KL_HUB"

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 330, 0, 360)
Main.Position = UDim2.new(0.03, 0, 0.25, 0)
Main.BackgroundColor3 = Color3.fromRGB(25,25,25)
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,0,0,40)
Title.Text = "KING LEGACY HUB (BASE)"
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundColor3 = Color3.fromRGB(15,15,15)
Title.TextScaled = true

-- BUTTON CREATOR
local function NewButton(text, y)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9,0,0,40)
    btn.Position = UDim2.new(0.05,0,0,y)
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Text = text
    return btn
end

-- BUTTONS
local AutoAttackBtn = NewButton("Auto Attack [OFF]", 60)
AutoAttackBtn.MouseButton1Click:Connect(function()
    State.AutoAttack = not State.AutoAttack
    AutoAttackBtn.Text = State.AutoAttack and "Auto Attack [ON]" or "Auto Attack [OFF]"
end)

local AutoBossBtn = NewButton("Auto Farm Boss [OFF]", 110)
AutoBossBtn.MouseButton1Click:Connect(function()
    State.AutoFarmBoss = not State.AutoFarmBoss
    AutoBossBtn.Text = State.AutoFarmBoss and "Auto Farm Boss [ON]" or "Auto Farm Boss [OFF]"
end)

local SeaMonsterBtn = NewButton("Auto Sea Monsters [OFF]", 160)
SeaMonsterBtn.MouseButton1Click:Connect(function()
    State.AutoSeaMonster = not State.AutoSeaMonster
    SeaMonsterBtn.Text = State.AutoSeaMonster and "Auto Sea Monsters [ON]" or "Auto Sea Monsters [OFF]"
end)

local HopBtn = NewButton("Auto Hop Server [OFF]", 210)
HopBtn.MouseButton1Click:Connect(function()
    State.AutoHop = not State.AutoHop
    HopBtn.Text = State.AutoHop and "Auto Hop Server [ON]" or "Auto Hop Server [OFF]"
end)

local BossBtn = NewButton("Boss: Sea King", 260)
BossBtn.MouseButton1Click:Connect(function()
    State.SelectedBoss = "Sea King"
    BossBtn.Text = "Boss: "..State.SelectedBoss
end)

-- STATUS LOOP (DEBUG)
task.spawn(function()
    while task.wait(1) do
        if State.AutoAttack then
            print("🔁 Auto Attack ativo")
        end
        if State.AutoFarmBoss then
            print("👑 Farming boss:", State.SelectedBoss)
        end
        if State.AutoSeaMonster then
            print("🌊 Sea Monsters ativos")
        end
        if State.AutoHop then
            print("🔀 Auto Hop ativo")
        end
    end
end)

print("✅ HUB BASE FUNCIONANDO")
