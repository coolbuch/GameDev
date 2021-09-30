require "vector"
require "ball"
require "player"

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()

  --         Ball settings
  location = Vector:create(300, height / 2)
  direction = Vector:create(1, 0.5)
  ball = Ball:create(10, location, direction)
  ball:setBounds(width, height)

  --         Player settings
  player = Player:create(height, 10, "left")
  enemy = Player:create(height, 10, "right")
end

function love.draw()
  love.graphics.print("Hello Horld", 600, 500)
  player:draw()
  enemy:draw()
  ball:draw()
end

function love.update()
  ball:update()
  ball:checkBounds(player)
  ball:checkBounds(enemy)
  player:update()
  enemy:update(ball)
end




function love.keypressed(key)
   if key == "escape" then
      love.event.quit()
   end
end
