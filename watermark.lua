-- watermark.lua

local watermarkEnabled = false
local screenGui
local textLabel

-- Función para iniciar el Watermark
local function startWatermark()
    if watermarkEnabled then return end

    watermarkEnabled = true

    -- Crear un ScreenGui
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WatermarkDisplay"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Crear un TextLabel para mostrar la información
    textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0, 300, 0, 50) -- Tamaño del texto
    textLabel.Position = UDim2.new(0.5, -150, 0, -50) -- Posición centrada en la parte superior
    textLabel.BackgroundTransparency = 1 -- Transparente
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Color blanco
    textLabel.Font = Enum.Font.SourceSansBold -- Fuente en negrita
    textLabel.TextSize = 10 -- Tamaño del texto
    textLabel.TextStrokeTransparency = 0.5 -- Efecto de contorno del texto (opcional)
    textLabel.Parent = screenGui

    -- Función para actualizar el texto
    local function actualizarTexto()
        local player = game.Players.LocalPlayer
        local fps = math.floor(1 / wait()) -- Calcular FPS
        local hora = os.date("%H:%M:%S") -- Obtener la hora
        textLabel.Text = string.format("PGv2 | FPS: %d | %s | %s", fps, player.Name, hora)
    end

    -- Actualizar el texto cada segundo
    spawn(function()
        while watermarkEnabled do
            actualizarTexto()
            wait(1)
        end
    end)
end

-- Función para detener el Watermark
local function stopWatermark()
    if not watermarkEnabled then return end

    watermarkEnabled = false

    -- Limpiar recursos
    if screenGui then
        screenGui:Destroy() -- Destruir el ScreenGui del Watermark
        screenGui = nil
    end
end

-- Exportar las funciones
return {
    start = startWatermark,
    stop = stopWatermark,
}
