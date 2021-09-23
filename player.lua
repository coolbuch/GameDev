Player = {}
Player.__index = Ball

function Player:create(height, speed)
  local player = {}
  setmetatable(player, Player)
  player.height = height
  player.speed = speed;
  return player
end

function Player:draw()
  love.graphics.rectangle("fill", self.height , self.height + 50, 10, 60)
end

function Player:update()
  if (love.keyboard.isDown("up") or love.keyboard.isDown("w")) and self.height > -40 then
      self.height = self.height - self.speed
  end
  if (love.keyboard.isDown("down") or love.keyboard.isDown("s")) and self.height < height - 120 then
      self.height = self.height + self.speed
  end
end
