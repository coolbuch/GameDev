Game = {}
Game.__index = Game

require "vector"
require "ball"
require "player"

function Game:create()
  local game = {}
  setmetatable(game, Game)
  self.scores = Vector:create(0,0)
  self.width = love.graphics.getWidth()
  self.height = love.graphics.getHeight()

  --         Ball settings
  location = Vector:create(300, self.height / 2)
  direction = Vector:create(1, 0.5)
  self.ball = Ball:create(10, location, direction)
  self.ball:setBounds(self.width, self.height)

  --         Player settings
  self.player = Player:create(self.height, 10, "left")
  self.enemy = Player:create(self.height, 4.5, "right")
  self.enemy:setBall(self.ball)

  return game
end


function Game:draw()
  love.graphics.print(self.scores.x, self.width/2 - 50, 50)
  love.graphics.print(self.scores.y, self.width/2 + 50, 50)
  self.player:draw()
  self.enemy:draw()
  self.ball:draw()
end

function Game:update()
  self.ball:update()
  if (self.ball:checkBounds(self.player)) then
    self.scores.x = self.scores.x + 1
  end
  if (self.ball:checkBounds(self.enemy)) then
    self.scores.y = self.scores.y + 1
  end
  self.player:update()
  self.enemy:update(self.ball)
end

function love.keypressed(key)
   if key == "escape" then
      love.event.quit()
   end
end
