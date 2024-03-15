-- manages the movement of the player

function MovePlayer(player, dt)
  PlayerMovement(player, dt)
  UpdateVelocity(player, dt)
  UpdatePosition(player, dt)
end

function PlayerMovement(player, dt)
  
  if love.keyboard.isDown("right") then
    player.x.vel = player.x.vel + 
                   player.starting_acceleration*dt*player.friction
  elseif player.x.vel > 0 then
    player.x.vel = player.x.vel - 
                   player.stopping_acceleration*dt*player.friction
  end
    
  if love.keyboard.isDown("left") then
    player.x.vel = player.x.vel - 
                   player.starting_acceleration*dt*player.friction
  elseif player.x.vel < 0 then
    player.x.vel = player.x.vel + 
                   player.stopping_acceleration*dt*player.friction
  end
    
  if love.keyboard.isDown("down") then
    player.y.vel = player.y.vel + 
                   player.starting_acceleration*dt*player.friction
  elseif player.y.vel > 0 then
    player.y.vel = player.y.vel - 
                   player.stopping_acceleration*dt*player.friction
  end
  
  if love.keyboard.isDown("up") then
    player.y.vel = player.y.vel - 
                   player.starting_acceleration*dt*player.friction
  elseif player.y.vel < 0 then
    player.y.vel = player.y.vel + 
                   player.stopping_acceleration*dt*player.friction
  end

  -- this doesnt let the player go too fast

  if player.x.vel > player.max_velocity then
    player.x.vel = player.max_velocity
  end

  if player.x.vel < -player.max_velocity then
    player.x.vel = -player.max_velocity
  end

  if player.y.vel > player.max_velocity then
    player.y.vel = player.max_velocity
  end

  if player.y.vel < -player.max_velocity then
    player.y.vel = -player.max_velocity
  end

  -- This is to make sure that when no keys are pressed,
  -- the playing wont drift around
  if player.x.vel < 5 and player.x.vel > -5 and
     not love.keyboard.isDown("left") and 
     not love.keyboard.isDown("right") then
    player.x.vel = 0
  end 

  if player.y.vel < 5 and player.y.vel > -5 and 
     not love.keyboard.isDown("up") and 
     not love.keyboard.isDown("down") then
    player.y.vel = 0
  end

end

function UpdateVelocity(player, dt)
  player.x.vel = player.x.vel + player.x.acc*dt
  player.y.vel = player.y.vel + player.y.acc*dt 
end

function UpdatePosition(player, dt)
  player.x.pos = player.x.pos + player.x.vel * dt
  player.y.pos = player.y.pos + player.y.vel * dt
end
