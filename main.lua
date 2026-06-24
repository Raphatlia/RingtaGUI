-- Astra Hub (Минимальная версия)
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = CoreGui
ScreenGui.Name = "AstraGUI"

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "✦ ASTRA HUB"
Title.TextColor3 = Color3.fromRGB(210, 170, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(200, 70, 70)
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = Title
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local LeftPanel = Instance.new("Frame")
LeftPanel.Size = UDim2.new(0, 100, 1, -40)
LeftPanel.Position = UDim2.new(0, 0, 0, 40)
LeftPanel.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
LeftPanel.BackgroundTransparency = 0.2
LeftPanel.Parent = MainFrame

local btnNames = {"Home", "Combat", "Farm", "Settings"}
local btns = {}

for i = 1, #btnNames do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 28)
    btn.Position = UDim2.new(0.075, 0, 0, 8 + (i-1) * 34)
    btn.BackgroundColor3 = (i == 1) and Color3.fromRGB(80, 40, 140) or Color3.fromRGB(30, 30, 40)
    btn.Text = btnNames[i]
    btn.TextColor3 = (i == 1) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 220)
    btn.TextSize = 13
    btn.Font = Enum.Font.Gotham
    btn.Parent = LeftPanel
    btns[i] = btn
end

local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(1, -110, 1, -40)
RightPanel.Position = UDim2.new(0, 105, 0, 40)
RightPanel.BackgroundTransparency = 1
RightPanel.Parent = MainFrame

local contents = {}
for i = 1, #btnNames do
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundTransparency = 1
    f.Visible = (i == 1)
    f.Parent = RightPanel
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, 0, 0, 40)
    l.Position = UDim2.new(0, 0, 0.2, 0)
    l.BackgroundTransparency = 1
    l.Text = "📁 " .. btnNames[i]
    l.TextColor3 = Color3.fromRGB(200, 200, 220)
    l.TextSize = 18
    l.Font = Enum.Font.GothamBold
    l.Parent = f
    contents[i] = f
end

for i = 1, #btns do
    btns[i].MouseButton1Click:Connect(function()
        for j = 1, #btns do
            btns[j].BackgroundColor3 = (j == i) and Color3.fromRGB(80, 40, 140) or Color3.fromRGB(30, 30, 40)
            btns[j].TextColor3 = (j == i) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 220)
        end
        for j = 1, #contents do
            contents[j].Visible = (j == i)
        end
    end)
end

print("✦ Astra Hub загружена!")
