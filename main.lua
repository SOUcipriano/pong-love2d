local largura_janela, altura_janela = love.graphics.getDimensions()

local largura, altura = 12, 96
local yy1, yy2 = 0, 0
local raio, xx3, yy3 = 5, 0, 0
local dxx, dyy = -1, -1
local speed_bola = 500
local speed_bola_inicial = 500
local speed_bola_max = 600 
local tempo_de_espera = 1
local tempo_espera_bola = 1
local altura_linha = 20
local largura_linha = 4
local espaco_entre_linhas = 15

local pontos_raquete_1 = 0
local pontos_raquete_2 = 0

local fonte
local som_1
local som_2

function love.load()
  yy1, yy2 = (altura_janela - altura) / 2, altura_janela / 2
  xx3, yy3 = largura_janela / 2, altura_janela / 2
  
  fonte = love.graphics.newFont(32)
  
  som_1 = love.audio.newSource("Laser_Shoot3.wav", "static")
  som_2 = love.audio.newSource("Blip_Select5.wav", "static")
end

function love.update(dt)
  
  if tempo_de_espera >= 0 then
    tempo_de_espera = tempo_de_espera - dt
    return
  end
  
  --movimentação da raquete esquerda
  if love.keyboard.isDown("w") and (yy1 >= 0) then
    yy1 = yy1 - (600 * dt)
  end
  
  if love.keyboard.isDown("s") and yy1 <= (altura_janela - altura) then
    yy1 = yy1 + (600 * dt)
  end
  
  --movimentação da raquete direita
  if love.keyboard.isDown("up") and yy2 >= 0 then
    yy2 = yy2 - (600 * dt)
  end
  
  if love.keyboard.isDown("down") and yy2 <= (altura_janela - altura) then
    yy2 = yy2 + (600 * dt)
  end
  
  
  --movimentação do circulo e detecção de colissão com as paredes
  if tempo_espera_bola >= 0 then
    tempo_espera_bola = tempo_espera_bola - dt
  else
    xx3 = xx3 + (speed_bola * dxx) * dt
    yy3 = yy3 + (speed_bola * dyy) * dt
  end
  
  if yy3 <= 0 or yy3 >= altura_janela then
    dyy = dyy * -1
    
    speed_bola = speed_bola * 1.2
    love.audio.play(som_1)
    
    if speed_bola >= speed_bola_max then
      speed_bola = speed_bola_max
    end
    
  end
  
  --colissão com a raquete
  if xx3 - raio <= 18 + largura and xx3 >= 18 and yy3 >= yy1 and yy3 <= yy1 + altura then
     dxx = dxx * -1
     
    speed_bola = speed_bola * 1.04
    love.audio.play(som_1)
    
    if speed_bola >= speed_bola_max then
      speed_bola = speed_bola_max
    end
    
  end
  
  if xx3 - raio <= (largura_janela - largura) - 18 + largura and xx3 >= (largura_janela - largura) - 18 and yy3 >= yy2 and yy3 <= yy2 + altura then
     dxx = dxx * -1
     
    speed_bola = speed_bola * 1.04
    love.audio.play(som_1)
    
    if speed_bola >= speed_bola_max then
      speed_bola = speed_bola_max
    end
  end
  
  -- fazendo pontos e reiniciando a partida
  if xx3 <= 0 then
    pontos_raquete_2 = pontos_raquete_2 + 1
    
    xx3, yy3 = largura_janela / 2, altura_janela / 2
    dxx = dxx * -1
    
    tempo_espera_bola = 1
    
    speed_bola = speed_bola_inicial
    
    love.audio.play(som_2)
  end
  
  if xx3 >= largura_janela then
    pontos_raquete_1 = pontos_raquete_1 + 1
    
    xx3, yy3 = largura_janela / 2, altura_janela / 2
    dxx = dxx * -1
    
    tempo_espera_bola = 1
    
    speed_bola = speed_bola_inicial
    
    love.audio.play(som_2)
  end
end

function love.draw()
  --desenhando um retângulo na esquerda
  love.graphics.rectangle("fill", 18, yy1, largura, altura)
  
  --desenhando um retângulo na direita
  love.graphics.rectangle("fill", (largura_janela - largura) - 18, yy2, largura, altura)
  
  --desenhando um circulo
  love.graphics.circle("fill", xx3, yy3, raio)
  
  --desenhando uma linha no meio
  for y = 0, altura_janela, altura_linha + espaco_entre_linhas do
    love.graphics.rectangle("fill", (largura_janela / 2) - (largura_linha / 2), y, largura_linha, altura_linha)
  end
  
  --desenhhando os pontos
  love.graphics.setFont(fonte)
  love.graphics.print(pontos_raquete_1.. " " ..pontos_raquete_2, (largura_janela / 2) - (50 / 2), 5)
end