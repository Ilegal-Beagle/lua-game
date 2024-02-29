
function DrawPlayer(player)
  local player_sprite = love.graphics.newImage("Player.png")
  love.graphics.draw(player_sprite, player.x.pos, player.y.pos, 0, .5, .5)
end

function PlayerMovement(player, dt)
  local CONST_ACCEL = 20
  local CONST_MAX_VELOCITY = 150
  
                -- INPUTS --
  if love.keyboard.isDown("right") then
    player.x.acc = player.x.acc + CONST_ACCEL*dt*player.friction
  end
    
  if love.keyboard.isDown("left") then
    player.x.acc = player.x.acc - CONST_ACCEL*dt*player.friction
  end
    
  if love.keyboard.isDown("down") then
    player.y.acc = player.y.acc - CONST_ACCEL*dt*player.friction
  end
  
  if love.keyboard.isDown("up") then
    player.y.acc = player.y.acc - CONST_ACCEL*dt*player.friction
  end


  -- THINGS THAT CHANGE HOW MOVEMENT FEELS? --
  if player.x.vel < CONST_MAX_VELOCITY or  
     player.y.vel > CONST_MAX_VELOCITY then
    UpdateVelocity(player, dt)
  end



  UpdatePosition(player, dt)
  
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
  
-- rounds a number
function round(num, place)
  local multi = 10^(place or 0)
  return math.floor(num * multi + .5) / multi
end

-- dumps table to a string
function dump(o)
   if type(o) == 'table' then
      local s = ''
      for k,v in pairs(o) do
        s = s .. v.name .. ' '
      end
      return s
   else
      return tostring(o)
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
