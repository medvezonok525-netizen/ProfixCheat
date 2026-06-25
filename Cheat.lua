-- Загрузочное окно (маленькое)
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.Name = "ProfixsCheat"

-- Маленькое загрузочное окно
local loadFrame = Instance.new("Frame")
loadFrame.Parent = screenGui
loadFrame.Size = UDim2.new(0, 250, 0, 100)
loadFrame.Position = UDim2.new(0.5, -125, 0.5, -50)
loadFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
loadFrame.BackgroundTransparency = 0.85
loadFrame.Active = true
loadFrame.Draggable = true

local loadCorner = Instance.new("UICorner")
loadCorner.Parent = loadFrame
loadCorner.CornerRadius = UDim.new(0, 10)

-- Название (Profixs Cheat)
local loadTitle = Instance.new("TextLabel")
loadTitle.Parent = loadFrame
loadTitle.Size = UDim2.new(1, 0, 0, 40)
loadTitle.Position = UDim2.new(0, 0, 0, 5)
loadTitle.Text = "Profixs Cheat"
loadTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
loadTitle.BackgroundTransparency = 1
loadTitle.Font = Enum.Font.GothamBold
loadTitle.TextSize = 24

-- Текст загрузки (скриптов 0-20)
local loadText = Instance.new("TextLabel")
loadText.Parent = loadFrame
loadText.Size = UDim2.new(1, 0, 0, 30)
loadText.Position = UDim2.new(0, 0, 0, 50)
loadText.Text = "Загружено скриптов: 0/20"
loadText.TextColor3 = Color3.fromRGB(200, 200, 200)
loadText.BackgroundTransparency = 1
loadText.Font = Enum.Font.Gotham
loadText.TextSize = 16

-- Прогресс-бар
local progressBar = Instance.new("Frame")
progressBar.Parent = loadFrame
progressBar.Size = UDim2.new(0.8, 0, 0, 6)
progressBar.Position = UDim2.new(0.1, 0, 0.85, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)

local progressCorner = Instance.new("UICorner")
progressCorner.Parent = progressBar
progressCorner.CornerRadius = UDim.new(0, 3)

local progressFill = Instance.new("Frame")
progressFill.Parent = progressBar
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)

local fillCorner = Instance.new("UICorner")
fillCorner.Parent = progressFill
fillCorner.CornerRadius = UDim.new(0, 3)

-- Загрузка (от 0 до 20 за 20 секунд)
local count = 0
local loadComplete = false

coroutine.wrap(function()
    while count <= 20 do
        wait(1)
        count = count + 1
        if count <= 20 then
            loadText.Text = "Загружено скриптов: " .. count .. "/20"
            progressFill.Size = UDim2.new(count / 20, 0, 1, 0)
        end
    end
    
    loadComplete = true
    
    -- Ждем 0.5 секунды и создаем главное окно
    wait(0.5)
    
    -- Удаляем загрузочное окно
    loadFrame:Destroy()
    
    -- Создаем главное окно с алмазами
    createMainGui()
end)()

-- Функция создания главного окна
function createMainGui()
    local mainFrame = Instance.new("Frame")
    mainFrame.Parent = screenGui
    mainFrame.Size = UDim2.new(0, 300, 0, 150)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    mainFrame.BackgroundTransparency = 0.9
    mainFrame.Active = true
    mainFrame.Draggable = true
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.Parent = mainFrame
    mainCorner.CornerRadius = UDim.new(0, 12)
    
    -- Заголовок
    local title = Instance.new("TextLabel")
    title.Parent = mainFrame
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "💎 Добавить алмазы"
    title.TextColor3 = Color3.fromRGB(255, 215, 0)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 22
    
    -- Поле ввода
    local textBox = Instance.new("TextBox")
    textBox.Parent = mainFrame
    textBox.Size = UDim2.new(0.8, 0, 0, 35)
    textBox.Position = UDim2.new(0.1, 0, 0.35, 0)
    textBox.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.PlaceholderText = "Введи число (0-100)"
    textBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    textBox.Text = ""
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 18
    textBox.ClearTextOnFocus = false
    
    local textCorner = Instance.new("UICorner")
    textCorner.Parent = textBox
    textCorner.CornerRadius = UDim.new(0, 8)
    
    -- Кнопка добавления алмазов
    local addButton = Instance.new("TextButton")
    addButton.Parent = mainFrame
    addButton.Size = UDim2.new(0.8, 0, 0, 40)
    addButton.Position = UDim2.new(0.1, 0, 0.65, 0)
    addButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    addButton.Text = "💎 Добавить алмазы"
    addButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    addButton.Font = Enum.Font.GothamBold
    addButton.TextSize = 18
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.Parent = addButton
    buttonCorner.CornerRadius = UDim.new(0, 8)
    
    -- Кнопка закрыть
    local closeButton = Instance.new("TextButton")
    closeButton.Parent = mainFrame
    closeButton.Size = UDim2.new(0, 25, 0, 25)
    closeButton.Position = UDim2.new(1, -30, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    closeButton.Text = "✕"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 16
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.Parent = closeButton
    closeCorner.CornerRadius = UDim.new(0, 5)
    
    -- Логика кнопки добавления алмазов
    addButton.MouseButton1Click:Connect(function()
        local input = tonumber(textBox.Text)
        if input and input >= 0 and input <= 100 then
            -- ПОИСК И ИЗМЕНЕНИЕ АЛМАЗОВ
            -- Пытаемся найти алмазы разными способами
            local player = game.Players.LocalPlayer
            
            -- Способ 1: через Leaderstats
            local leaderstats = player:FindFirstChild("leaderstats")
            if leaderstats then
                local diamonds = leaderstats:FindFirstChild("Diamonds") or leaderstats:FindFirstChild("Gems") or leaderstats:FindFirstChild("Gem")
                if diamonds then
                    diamonds.Value = input
                    print("[✓] Алмазы установлены на " .. input)
                    textBox.Text = "Готово!"
                    wait(1)
                    textBox.Text = ""
                    return
                end
            end
            
            -- Способ 2: через Stats
            local stats = player:FindFirstChild("Stats")
            if stats then
                local diamonds = stats:FindFirstChild("Diamonds") or stats:FindFirstChild("Gems") or stats:FindFirstChild("Gem")
                if diamonds then
                    diamonds.Value = input
                    print("[✓] Алмазы установлены на " .. input)
                    textBox.Text = "Готово!"
                    wait(1)
                    textBox.Text = ""
                    return
                end
            end
            
            -- Способ 3: поиск по всем дочерним объектам игрока
            for _, child in ipairs(player:GetChildren()) do
                if child:IsA("IntValue") or child:IsA("NumberValue") then
                    local name = child.Name:lower()
                    if name:find("diamond") or name:find("gem") or name:find("gemstone") or name:find("алмаз") then
                        child.Value = input
                        print("[✓] Алмазы установлены на " .. input)
                        textBox.Text = "Готово!"
                        wait(1)
                        textBox.Text = ""
                        return
                    end
                end
            end
            
            -- Способ 4: глобальный поиск по игре (если алмазы в другом месте)
            local success, result = pcall(function()
                -- Ищем игровой объект, который обычно хранит валюту
                local gameData = game:GetService("ReplicatedStorage"):FindFirstChild("Data") or 
                                workspace:FindFirstChild("Data") or 
                                game:GetService("Players"):FindFirstChild("Data")
                
                if gameData then
                    local playerData = gameData:FindFirstChild(player.Name)
                    if playerData then
                        for _, child in ipairs(playerData:GetChildren()) do
                            if child:IsA("IntValue") or child:IsA("NumberValue") then
                                local name = child.Name:lower()
                                if name:find("diamond") or name:find("gem") or name:find("gemstone") or name:find("алмаз") or name:find("currency") then
                                    child.Value = input
                                    print("[✓] Алмазы установлены на " .. input)
                                    textBox.Text = "Готово!"
                                    wait(1)
                                    textBox.Text = ""
                                    return
                                end
                            end
                        end
                    end
                end
            end)
            
            if not success then
                print("[!] Не удалось найти алмазы автоматически")
                textBox.Text = "Ошибка!"
                wait(1)
                textBox.Text = ""
            end
        else
            textBox.Text = "Введи число 0-100!"
            wait(1)
            textBox.Text = ""
        end
    end)
    
    -- Закрытие окна
    closeButton.MouseButton1Click:Connect(function()
        mainFrame:Destroy()
    end)
end
