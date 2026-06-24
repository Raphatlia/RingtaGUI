-- SpaceBerq | Ringta GUI v77 (Максимально простая версия)
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

-- ============================================
-- ЭКРАН
-- ============================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RingtaGUI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- ============================================
-- ИКОНКА
-- ============================================
local Icon = Instance.new("ImageButton")
Icon.Size = UDim2.new(0, 45, 0, 45)
Icon.Position = UDim2.new(0.02, 0, 0.02, 0)
Icon.BackgroundColor3 = Color3.fromRGB(80, 40, 140)
Icon.BackgroundTransparency = 0.2
Icon.Image = "rbxassetid://4483362458"
Icon.Parent = ScreenGui

local IconText = Instance.new("TextLabel")
IconText.Size = UDim2.new(1, 0, 1, 0)
IconText.BackgroundTransparency = 1
IconText.Text = "R"
IconText.TextColor3 = Color3.fromRGB(255, 255, 255)
IconText.TextSize = 22
IconText.Font = Enum.Font.GothamBold
IconText.Parent = Icon

-- ============================================
-- ГЛАВНОЕ ОКНО
-- ============================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 360)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 14)
Corner.Parent = MainFrame

Icon.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    Icon.Visible = false
end)

-- ============================================
-- ШАПКА (Упрощённая)
-- ============================================
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(20, 20, 32)
Header.BackgroundTransparency = 0.2
Header.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.5, 0, 1, 0)
Title.Position = UDim2.new(0.05, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "RINGTA"
Title.TextColor3 = Color3.fromRGB(210, 170, 255)
Title.TextSize = 16
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(180, 180, 200)
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = Header
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    Icon.Visible = true
end)

-- ============================================
-- ПЕРЕТАСКИВАНИЕ (ШАПКИ)
-- ============================================
local dragging = false
local dragStart, startPos

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- ============================================
-- ЛЕВАЯ КОЛОНКА
-- ============================================
local LeftPanel = Instance.new("Frame")
LeftPanel.Size = UDim2.new(0, 110, 1, -40)
LeftPanel.Position = UDim2.new(0, 0, 0, 40)
LeftPanel.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
LeftPanel.BackgroundTransparency = 0.2
LeftPanel.Parent = MainFrame

local Border = Instance.new("Frame")
Border.Size = UDim2.new(0, 1, 0.85, 0)
Border.Position = UDim2.new(1, -1, 0.075, 0)
Border.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
Border.BackgroundTransparency = 0.4
Border.Parent = LeftPanel

-- ============================================
-- КНОПКИ (БЕЗ ЭМОДЗИ)
-- ============================================
local btnNames = {"Home", "Combat", "Farm", "Misc"}
local btnObjects = {}
local contentFrames = {}

for i, name in pairs(btnNames) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 28)
    btn.Position = UDim2.new(0.075, 0, 0, 8 + (i-1) * 34)
    btn.BackgroundColor3 = (i == 1) and Color3.fromRGB(80, 40, 140) or Color3.fromRGB(30, 30, 40)
    btn.Text = name
    btn.TextColor3 = (i == 1) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 220)
    btn.TextSize = 13
    btn.Font = Enum.Font.Gotham
    btn.BorderSizePixel = 1
    btn.BorderColor3 = (i == 1) and Color3.fromRGB(80, 40, 140) or Color3.fromRGB(40, 40, 50)
    btn.Parent = LeftPanel
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btnObjects[i] = btn
end

-- ============================================
-- ПРАВАЯ КОЛОНКА
-- ============================================
local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(1, -120, 1, -40)
RightPanel.Position = UDim2.new(0, 115, 0, 40)
RightPanel.BackgroundTransparency = 1
RightPanel.Parent = MainFrame

-- ============================================
-- КОНТЕНТ
-- ============================================
local function CreateContent(name)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.Visible = false
    frame.Parent = RightPanel
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 40)
    label.Position = UDim2.new(0, 0, 0.2, 0)
    label.BackgroundTransparency = 1
    label.Text = "📁 " .. name
    label.TextColor3 = Color3.fromRGB(200, 200, 220)
    label.TextSize = 18
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.Parent = frame
    
    return frame
end

local homeContent = CreateContent("Home")
local combatContent = CreateContent("Combat")
local farmContent = CreateContent("Farm")
local miscContent = CreateContent("Misc")

homeContent.Visible = true

local allContents = {homeContent, combatContent, farmContent, miscContent}

-- ============================================
-- ПЕРЕКЛЮЧЕНИЕ (ПРОСТОЕ И НАДЁЖНОЕ)
-- ============================================
local function SwitchTab(index)
    for i, btn in pairs(btnObjects) do
        if i == index then
            btn.BackgroundColor3 = Color3.fromRGB(80, 40, 140)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.BorderColor3 = Color3.fromRGB(80, 40, 140)
        else
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            btn.TextColor3 = Color3.fromRGB(200, 200, 220)
            btn.BorderColor3 = Color3.fromRGB(40, 40, 50)
        end
    end
    for i, content in pairs(allContents) do
        content.Visible = (i == index)
    end
end

for i, btn in pairs(btnObjects) do
    btn.MouseButton1Click:Connect(function()
        SwitchTab(i)
    end)
end

print("Ringta GUI v77 загружена!")
