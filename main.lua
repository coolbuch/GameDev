require "vector"
require "ball"
require "player"

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  location = Vector:create(300, height / 2)
  direction = Vector:create(0.5, 1)
  ball = Ball:create(3, location, direction)
  ball:setBounds(width, height)
  player = Player:create(height/ 2, 20)
end

function love.draw()
  love.graphics.print("Hello Horld", 400, 300)
  --player:draw()
  ball:draw()
end

function love.update(dt)

  player:update()

  ball:update()
  ball:checkBounds()
end




function love.keypressed(key)
   if key == "escape" then
      love.event.quit()
   end
end
