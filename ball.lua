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


function Ball:checkBounds()
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


function Ball:draw()
  love.graphics.circle("fill", self.location.x, self.location.y, self.size)
end

function Ball:update()
    self.location = self.location + self.direction * self.speed
end
