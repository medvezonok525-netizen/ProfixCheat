-- Загрузочное окно
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.Name = "ProfixsCheat"

-- Загрузочное окно
local loadFrame = Instance.new("Frame")
loadFrame.Parent = screenGui
loadFrame.Size = UDim2.new(0, 280, 0, 120)
loadFrame.Position = UDim2.new(0.5, -140, 0.5, -60)
loadFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadFrame.BackgroundTransparency = 0
loadFrame.Active = true
loadFrame.Draggable = true

local loadCorner = Instance.new("UICorner")
loadCorner.Parent = loadFrame
loadCorner.CornerRadius = UDim.new(0, 12)

-- Название
local loadTitle = Instance.new("TextLabel")
loadTitle.Parent = loadFrame
loadTitle.Size = UDim2.new(1, 0, 0, 40)
loadTitle.Position = UDim2.new(0, 0, 0, 5)
loadTitle.Text = "Profixs Cheat"
loadTitle.TextColor3 = Color3.fromRGB(0, 200, 255)
loadTitle.BackgroundTransparency = 1
loadTitle.Font = Enum.Font.GothamBold
loadTitle.TextSize = 24

-- Текст загрузки
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

-- Загрузка
local count = 0

coroutine.wrap(function()
    while count <= 20 do
        wait(1)
        count = count + 1
        if count <= 20 then
            loadText.Text = "Загружено скриптов: " .. count .. "/20"
            progressFill.Size = UDim2.new(count / 20, 0, 1, 0)
        end
    end
    
    wait(0.5)
    loadFrame:Destroy()
    createMainGui()
end)()

-- Главное окно
function createMainGui()
    local mainFrame = Instance.new("Frame")
    mainFrame.Parent = screenGui
    mainFrame.Size = UDim2.new(0, 350, 0, 150)
    mainFrame.Position = UDim2.new(0.5, -175, 0.5, -75)
    mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    mainFrame.BackgroundTransparency = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.Parent = mainFrame
    mainCorner.CornerRadius = UDim.new(0, 12)
    
    -- Заголовок
    local title = Instance.new("TextLabel")
    title.Parent = mainFrame
    title.Size = UDim2.new(1, 0, 0, 45)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "👊 КИДАЛО"
    title.TextColor3 = Color3.fromRGB(255, 50, 50)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 26
    
    -- Текст статуса
    local statusText = Instance.new("TextLabel")
    statusText.Parent = mainFrame
    statusText.Size = UDim2.new(0.6, 0, 0, 30)
    statusText.Position = UDim2.new(0.05, 0, 0.45, 0)
    statusText.Text = "Режим: ВЫКЛ"
    statusText.TextColor3 = Color3.fromRGB(200, 200, 200)
    statusText.BackgroundTransparency = 1
    statusText.Font = Enum.Font.GothamBold
    statusText.TextSize = 18
    statusText.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Анимированный выключатель (кнопка)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = mainFrame
    toggleButton.Size = UDim2.new(0, 60, 0, 30)
    toggleButton.Position = UDim2.new(0.75, 0, 0.42, 0)
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    toggleButton.Text = "ВЫКЛ"
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.TextSize = 14
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.Parent = toggleButton
    toggleCorner.CornerRadius = UDim.new(0, 8)
    
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
    
    -- Переменные состояния
    local isActive = false
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local rootPart = character:WaitForChild("HumanoidRootPart")
    
    -- Анимация дерганья
    local twitchConnection = nil
    local throwConnection = nil
    
    -- Функция для дерганья персонажа
    function startTwitching()
        if twitchConnection then return end
        
        twitchConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if not isActive then return end
            
            local char = player.Character
            if not char then return end
            
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChild("Humanoid")
            
            if hrp and hum then
                -- Дергаем персонажа в случайные стороны
                hrp.Velocity = Vector3.new(
                    math.random(-30, 30),
                    math.random(10, 40),
                    math.random(-30, 30)
                )
                
                -- Иногда резко поворачиваем
                if math.random(1, 5) == 1 then
                    hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(math.random(-90, 90)), 0)
                end
            end
        end)
    end
    
    -- Функция для выкидывания игроков
    function startThrowing()
        if throwConnection then return end
        
        throwConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if not isActive then return end
            
            local char = player.Character
            if not char then return end
            
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            
            -- Ищем ближайшего игрока
            local nearestPlayer = nil
            local nearestDist = 15 -- Радиус действия
            
            for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
                if otherPlayer ~= player then
                    local otherChar = otherPlayer.Character
                    if otherChar then
                        local otherHrp = otherChar:FindFirstChild("HumanoidRootPart")
                        if otherHrp then
                            local dist = (hrp.Position - otherHrp.Position).Magnitude
                            if dist < nearestDist then
                                nearestDist = dist
                                nearestPlayer = otherPlayer
                            end
                        end
                    end
                end
            end
            
            -- Если нашли игрока - выкидываем
            if nearestPlayer then
                local otherChar = nearestPlayer.Character
                if otherChar then
                    local otherHrp = otherChar:FindFirstChild("HumanoidRootPart")
                    if otherHrp then
                        -- Выкидываем далеко за карту
                        local direction = (otherHrp.Position - hrp.Position).unit
                        local force = Vector3.new(
                            direction.X * 500,
                            300 + math.random(0, 200),
                            direction.Z * 500
                        )
                        
                        otherHrp.Velocity = force
                        
                        -- Добавляем урон если есть
                        local hum = otherChar:FindFirstChild("Humanoid")
                        if hum then
                            hum:TakeDamage(100)
                        end
                        
                        print("[🔥] Выкинул игрока: " .. nearestPlayer.Name)
                    end
                end
            end
        end)
    end
    
    -- Функция остановки всего
    function stopAll()
        isActive = false
        
        if twitchConnection then
            twitchConnection:Disconnect()
            twitchConnection = nil
        end
        
        if throwConnection then
            throwConnection:Disconnect()
            throwConnection = nil
        end
        
        -- Возвращаем персонажа в норму
        local char = player.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Velocity = Vector3.new(0, 0, 0)
            end
        end
        
        statusText.Text = "Режим: ВЫКЛ"
        statusText.TextColor3 = Color3.fromRGB(200, 200, 200)
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        toggleButton.Text = "ВЫКЛ"
    end
    
    -- Функция запуска всего
    function startAll()
        isActive = true
        statusText.Text = "Режим: ВКЛ"
        statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        toggleButton.Text = "ВКЛ"
        
        startTwitching()
        startThrowing()
    end
    
    -- Логика кнопки включения/выключения
    toggleButton.MouseButton1Click:Connect(function()
        if isActive then
            stopAll()
        else
            startAll()
        end
    end)
    
    -- Обновляем персонажа если он пересоздался
    player.CharacterAdded:Connect(function(newChar)
        wait(1)
        if isActive then
            -- Перезапускаем всё для нового персонажа
            stopAll()
            wait(0.5)
            startAll()
        end
    end)
    
    -- Закрытие окна
    closeButton.MouseButton1Click:Connect(function()
        stopAll()
        mainFrame:Destroy()
    end)
end
