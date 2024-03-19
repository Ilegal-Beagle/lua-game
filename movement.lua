-- manages the movement of the player

function MovePlayer(player, dt)
  MovementController(player, dt)
  UpdateVelocity(player, dt)
  UpdatePosition(player, dt)
end

function MovementController(player, dt)
  local x_velocity = player:GetXVel()
  local y_velocity = player:GetYVel()
  local delta_starting = player.starting_acceleration*dt*player.friction
  local delta_stopping = player.stopping_acceleration*dt*player.friction
  
  if love.keyboard.isDown("right") then
    player:SetXVel(x_velocity + delta_starting) 
  elseif x_velocity > 0 then
    player:SetXVel(x_velocity - delta_stopping)
  end
    
  if love.keyboard.isDown("left") then
    player:SetXVel(x_velocity - delta_starting)
  elseif x_velocity < 0 then
    player:SetXVel(x_velocity + delta_stopping)
  end
    
  if love.keyboard.isDown("down") then
    player:SetYVel(y_velocity + delta_starting)
  elseif y_velocity > 0 then
    player:SetYVel(y_velocity - delta_stopping)
  end
  
  if love.keyboard.isDown("up") then
    player:SetYVel(y_velocity - delta_starting)
  elseif y_velocity < 0 then
    player:SetYVel(y_velocity + delta_stopping)
  end

  ControlMaxVelocity(player)

  ControlDeadZones(player)

end


-- HELPER FUNCTIONS TO MOVEMENTCONTROLLER() --

-- Prevents player from going past thier max velocity
function ControlMaxVelocity(player)
  local x_velocity = player:GetXVel()
  local y_velocity = player:GetYVel()
  local max_velocity = player.max_velocity

  if x_velocity > max_velocity then
    player:SetXVel(max_velocity)
  end

  if x_velocity < -max_velocity then
    player:SetXVel(-max_velocity)
  end

  if y_velocity > max_velocity then
    player:SetYVel(max_velocity)
  end

  if y_velocity < -max_velocity then
    player:SetYVel(-max_velocity)
  end
end

-- This is to make sure that when no keys are pressed,
-- the playing wont drift around
function ControlDeadZones(player)
  local deadzone_value = 5
  local x_velocity = player:GetXVel()
  local y_velocity = player:GetYVel()

  if x_velocity < deadzone_value and x_velocity > -deadzone_value and
     not love.keyboard.isDown("left") and not love.keyboard.isDown("right") then
    player:SetXVel(0)
  end 

  if y_velocity < deadzone_value and y_velocity > -deadzone_value and 
     not love.keyboard.isDown("up") and not love.keyboard.isDown("down") then
    player:SetYVel(0)
  end
end

function UpdateVelocity(player, dt)
  player:SetXVel(player:GetXVel() + player:GetXAcc()*dt)
  player:SetYVel(player:GetYVel() + player:GetYAcc()*dt) 
end

function UpdatePosition(player, dt)
  player:SetX(player:GetX() + player:GetXVel()*dt)
  player:SetY(player:GetY() + player:GetYVel()*dt)
end
