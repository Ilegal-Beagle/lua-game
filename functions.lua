
function InitilizePlayer()
  local to_return = 
  {
    x  = { pos = 400, vel = 0, acc = 0},
    y = { pos = 400, vel = 0, acc = 0},

    friction  = .9,
    acceleration = 200,
    max_velocity = 200,
    inventory = {}
  }

  return to_return
end

function MovePlayer(player, dt)
  PlayerMovement(player, dt)
  UpdateVelocity(player, dt)
  UpdatePosition(player, dt)
end


-- The next three functions PlayerMovement,
-- UpdateVelocity, and UpdatePosition are all
-- helper functions for MovePlayer
function PlayerMovement(player, dt)
  
  -- handles key presses
  -- if key is pressed, move that way
  -- otherwise, slow the character down
  if love.keyboard.isDown("right") then
    player.x.vel = player.x.vel + player.acceleration*dt*player.friction
  elseif player.x.vel > 0 then
    player.x.vel = player.x.vel - player.acceleration*dt*player.friction
  end
    
  if love.keyboard.isDown("left") then
    player.x.vel = player.x.vel - player.acceleration*dt*player.friction
  elseif player.x.vel < 0 then
    player.x.vel = player.x.vel + player.acceleration*dt*player.friction
  end
    
  if love.keyboard.isDown("down") then
    player.y.vel = player.y.vel + player.acceleration*dt*player.friction
  elseif player.y.vel > 0 then
    player.y.vel = player.y.vel - player.acceleration*dt*player.friction
  end
  
  if love.keyboard.isDown("up") then
    player.y.vel = player.y.vel - player.acceleration*dt*player.friction
  elseif player.y.vel < 0 then
    player.y.vel = player.y.vel + player.acceleration*dt*player.friction
  end

  -- This is like to make sure that when no keys are pressed,
  -- the playing wont drift around
  if player.x.vel < 5 and player.x.vel > -5 and
     not love.keyboard.isDown("left") and not love.keyboard.isDown("right") then
    player.x.vel = 0
  end 

  if player.y.vel < 5 and player.y.vel > -5 and 
     not love.keyboard.isDown("up") and not love.keyboard.isDown("down") then
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

-- Checks if item has been touched by player
-- If item is collected, remmoves it from field
-- and added to player inventory
function ItemCheck(item, player)
  if player.x.pos > item.x and player.x.pos < (item.x + 50) and 
     player.y.pos > item.y and player.y.pos < (item.y + 50) then
    if not item.is_collected then
      table.insert(player.inventory, item)
      item.is_collected = true
    end
  end
end
  
-- checks if player is at edge of camera view
-- if so, it will bring the player past the camera's view
-- and move the camera to place the player goes
function AtEdge(player, bg1, bg2)
  local window_x_max = 770
  local window_x_min = 30
  if player.x.pos >= window_x_max then
    -- move player out of window
    player.x.pos = 30
    -- then, move window and player so next tile is in frame
    bg1.x = bg1.x - 800
    bg2.x = bg2.x - 800
    
  elseif player.x.pos <= window_x_min then
    -- move player out of window
    player.x.pos = 770
    bg1.x = bg1.x + 800
    bg2.x = bg2.x + 800
    
  end
end

-- draws an image
function DrawItem(item)
  local offset = 25
  local r = 0 ;local g = 0;local b = 0
  image = love.graphics.newImage(item.name..".png")
  
  if item.is_collected then
    return
  end

  love.graphics.draw(image, item.x, item.y, 0, .3, .3)
end

function DrawPlayer(player)
  local player_sprite = love.graphics.newImage("Player.png")
  love.graphics.draw(player_sprite, player.x.pos, player.y.pos, 0, .5, .5)
end

-- the second and third argument is for the x and y position
Draw = {}

function Draw:Coordinates(player, x, y)
  love.graphics.print(tostring(round(player.x.pos)).." "..tostring(round(player.y.pos)), x, y)
end

function Draw:Velocity(player, x, y)
  love.graphics.print(tostring(round(player.x.vel)).." "..tostring(round(player.y.vel)), x, y)
end