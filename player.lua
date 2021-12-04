Player = {}
Player.__index = Player

function Player:create(height, speed, side)
  local player = {}
  setmetatable(player, Player)
  player.side = side or "left"
  player.position = height / 2
  player.fieldHeight = height
  player.speed = speed
  player.thickness = 10
  player.height = 60
  if (side == "left") then
    player.width = 20
  else
    player.width  = love.graphics.getWidth() - 30
  end

  return player
end

function Player:draw()
    love.graphics.rectangle("fill", self.width , self.height + self.position, self.thickness, self.height)
    if self.gball then
      love.graphics.print(self.gball.location.y , 500, 500)
    end
end

function Player:setBall(ball)
  self.gball = ball
end

function Player:update(ball)
  if (self.side == "left") then
    if (love.keyboard.isDown("up") or love.keyboard.isDown("w")) and self.position > -self.height then
        self.position = self.position - self.speed
    end
    if (love.keyboard.isDown("down") or love.keyboard.isDown("s")) and self.position < self.fieldHeight - self.height * 2 then
        self.position = self.position + self.speed
    end
  end
  if (self.side == "right") then
    if (self.position  + self.height  < self.gball.location.y)  then         --
      self.position = self.position + self.speed
    end
    if (self.position + self.height > self.gball.location.y - 20)  then
      self.position = self.position - self.speed
    end
  end
end
