require "game"

function love.load()
  game = Game:create()
  start = false
end

function love.draw()
  if start then
    game:draw()
  end
  if !start then
    
  end
end

function love.update()
  if start then
    game:update()
  end
end

function love.keypressed(key)
   if key == "escape" then
      love.event.quit()
   end
end
