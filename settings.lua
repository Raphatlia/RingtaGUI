-- Astra Hub | Настройки
local Settings = {
    -- Основное
    Title = "✦ ASTRA HUB",
    Icon = "rbxassetid://4483362458",
    Theme = Color3.fromRGB(80, 40, 140),
    
    -- Визуал
    Glass = true,           -- Прозрачность
    Animations = true,      -- Анимации
    Sounds = false,         -- Звук (пока отключен)
    
    -- Размеры
    Width = 400,
    Height = 400,
    SidebarWidth = 110,
    
    -- Вкладки
    Tabs = {"🏠 Home", "⚔️ Combat", "🌾 Farm", "⚙️ Settings"},
    
    -- Темы
    Themes = {
        {"Фиолетовый", Color3.fromRGB(80, 40, 140)},
        {"Красный", Color3.fromRGB(180, 40, 40)},
        {"Синий", Color3.fromRGB(40, 80, 180)},
        {"Зелёный", Color3.fromRGB(40, 180, 80)},
        {"Оранжевый", Color3.fromRGB(180, 120, 40)},
    },
}

return Settings
