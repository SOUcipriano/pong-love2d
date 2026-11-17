function love.conf(t)
    -- Título da janela do jogo
    t.identity = nil                  -- Nome do save data (string)
    t.version = "11.5"                -- Versão do LÖVE para qual o jogo foi feito
    t.console = false                 -- Se true, abre um console de terminal junto (bom para debug no Windows)

    -- Configurações de Janela e Vídeo
    t.window.title = "Meu Jogo Love2D" -- Título que aparece na barra da janela
    t.window.icon = nil               -- Caminho para o ícone (ex: "assets/icon.png")
    t.window.width = 1280             -- Largura inicial da janela em pixels
    t.window.height = 720             -- Altura inicial da janela em pixels
    t.window.borderless = false       -- Remove as bordas da janela (barra de título, fechar, minimizar)
    t.window.resizable = true         -- Permite que o jogador redimensione a janela arrastando as bordas
    t.window.minwidth = 640           -- Largura mínima permitida ao redimensionar
    t.window.minheight = 360          -- Altura mínima permitida ao redimensionar
    t.window.fullscreen = false       -- Inicia em tela cheia (true ou false)
    t.window.fullscreentype = "desktop" -- "desktop" (mantém resolução nativa) ou "exclusive"
    t.window.vsync = 1                -- Sincronização vertical: 1 (ativado), 0 (desativado), -1 (adaptativo)
    t.window.msaa = 0                 -- Antialiasing (MSAA) - 0 desliga, ou valores como 2, 4, 8
    t.window.display = 1              -- Índice do monitor caso haja múltiplos monitores
    
    -- Módulos que você deseja carregar (desligue os que não usar para economizar memória)
    t.modules.audio = true
    t.modules.timer = true
    t.modules.window = true
    t.modules.graphics = true
    t.modules.math = true
    t.modules.keyboard = true
    t.modules.mouse = true
    t.modules.sound = true
    t.modules.system = true
    t.modules.touch = true
    t.modules.image = true
    t.modules.joystick = true
    t.modules.font = true
    t.modules.thread = true
    t.modules.physics = true
end