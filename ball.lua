Ball = {}
Ball.__index = Ball

function Ball:create(speed, location, direction)
  local ball = {}
  setmetatable(ball, Ball)
  ball.speed = speed
  ball.location = location
  ball.direction = direction
  ball.size = 5
  return ball
end

function Ball:setBounds(width, height)
  self.fieldWidth = width
  self.fieldHeight = height
end



function Ball:checkBounds(player)
  if player.side == "right" then
    if (self.location.x > player.width - self.size - player.thickness) and (self.location.x < player.width)
    and (self.location.y <= player.position + player.height * 2 + self.size)
    and (self.location.y >= player.position + player.height - self.size) then
      return(player.side)
    end
  else
    if (self.location.x <= player.width + self.size + player.thickness)
    and (self.location.y <= player.position + player.height * 2 + self.size)
    and (self.location.y >= player.position + player.height - self.size) then
      self.direction.x = self.direction.x * -1
    end
  end
  if self.location.x > self.fieldWidth - self.size then
      self.location.x = self.fieldWidth - self.size
      self.direction.x = self.direction.x * -1
  elseif self.location.x < self.size then
      self.location.x = self.size
      self.direction.x = self.direction.x * -1
  end
  if self.location.y > self.fieldHeight - self.size then
      self.location.y = self.fieldHeight - self.size
      self.direction.y = self.direction.y * -1
  elseif self.location.y < self.size then
      self.location.y = self.size
      self.direction.y = self.direction.y * -1
  end
end

function Ball:checkPlayer()

end

function Ball:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.circle("fill", self.location.x, self.location.y, self.size)
end

function Ball:update()
    self.location = self.location + self.direction * self.speed
end
