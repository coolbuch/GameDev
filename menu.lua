Menu = {}
Menu.__index = Menu

function Menu:create()

end

function Menu:draw()
  love.graphics.print("PONG", 200, 200)
  love.graphics.print("Press ENTER to play", 200, 500)
end

function Menu:update()

end

function love.keypressed(key)
   if key == "escape" then
      love.event.quit()
   end
end
