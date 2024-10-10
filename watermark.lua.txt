-- Crear un ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FPSDisplay"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Crear un TextLabel para mostrar la información
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(0, 300, 0, 50) -- Tamaño del texto
textLabel.Position = UDim2.new(0.5, -150, 0, -50) -- Posición centrada en la parte superior
textLabel.BackgroundTransparency = 1 -- Transparente
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Color blanco
textLabel.Font = Enum.Font.SourceSansBold -- Fuente en negrita
textLabel.TextSize = 10 -- Tamaño del texto
textLabel.TextStrokeTransparency = 0.5 -- Efecto de contorno del texto (opcional)
textLabel.Parent = screenGui

-- Variable para ajustar la posición vertical
local offsetY = -50 -- Cambia este valor para mover el texto más arriba o más abajo

-- Función para actualizar la posición del TextLabel
local function actualizarPosicion()
    textLabel.Position = UDim2.new(0.5, -150, 0, offsetY)
end

-- Llamar a la función para actualizar la posición
actualizarPosicion()

-- Función para actualizar el FPS, nombre de usuario y hora
local function actualizarTexto()
    local player = game.Players.LocalPlayer
    local fps = math.floor(1 / wait()) -- Calcular FPS
    local hora = os.date("%H:%M:%S") -- Obtener la hora
    textLabel.Text = string.format("PGv2 | FPS: %d | %s | %s", fps, player.Name, hora)
end

-- Actualizar el texto cada segundo
while true do
    actualizarTexto()
    wait(1)
end
