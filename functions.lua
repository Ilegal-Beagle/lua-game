-- functions.lua
-- various functions that need to be organized into seperate files

-- functions to load from file
<<<<<<< HEAD

function LoadArea(specified_area)
=======

function LoadArea()

  area = {}

  -- function used inside area.lua
  function CreateArea(b)
    area.background = b.background
    area.items = b.items
  end
  
  -- loads and executes area.lua
  dofile("area.lua")

  --printing out the map information
  print(area.background)
  area.background = love.graphics.newImage(area.background)

  for _, item in ipairs(area.items) do
    print(item.name, item.image, item.x, item.y)
    area.items[_].name  = item.name
    area.items[_].image = item.image
    area.items[_].x     = item.x
    area.items[_].y     = item.y
  end

  return area
  
end



-- Initilization functions

function InitilizePlayer()
  local to_return = 
  {
    x  = { pos = 400, vel = 0, acc = 0},
    y = { pos = 400, vel = 0, acc = 0},

    friction  = .3,
    starting_acceleration = 500,
    stopping_acceleration = 700,
    max_velocity = 100,
    hitbox = 0,
    inventory = {}
  }
>>>>>>> 8fb0efde642918a887ce2a87621c2d6d54ec6656

  local area = {}

<<<<<<< HEAD
  -- copies info of chunk from area.lua to area
  function CreateArea(b)
    if specified_area == b.area_name then
      area = b
=======
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

-- Checks if item has been touched by player
-- If item is collected, remmoves it from field
-- and added to player inventory
function ItemCheck(item, player)
  if player.x.pos > item.x and player.x.pos < (item.x + 50) and 
     player.y.pos > item.y and player.y.pos < (item.y + 50) then
    if not item.is_collected then
      table.insert(player.inventory, item)
      item.is_collected = true
>>>>>>> 8fb0efde642918a887ce2a87621c2d6d54ec6656
    end
  end

  -- loads and executes area.lua
  dofile("area.lua")

  -- make background a love image
  area.background = love.graphics.newImage(area.background)

  return area
  
end

function LoadPlayer()
  local player = {}

  function CreatePlayer(b)
    player = b
  end

  dofile("player.lua")

  return player
end

  
-- checks if player is at edge of camera view
<<<<<<< HEAD
-- if so, go to adjacent area
function AtEdge(player, map)
  local window_x_max, window_y_max = love.graphics.getDimensions()
  local window_x_min, window_y_min = 0
  local relocate_player_x_position = 30
  local relocate_player_y_position = 30

  if player.x.pos > window_x_max then
    map.bg_x = map.bg_x - window_x_max
    player.x.pos = relocate_player_x_position
    map = LoadArea("plains6")
    
    
  elseif player.x.pos < window_x_min then
    map.bg_x = map.bg_x + window_x_max
    player.x.pos = window_x_max - relocate_player_x_position
    
  end
end
=======
-- if so, it will bring the player past the camera's view
-- and move the camera to place the player goes
function AtEdge(player, map)
  local window_x_max = 770
  local window_x_min = 30
  if player.x.pos >= window_x_max then
    -- move player out of window
    player.x.pos = 30
    -- then, move window and player so next tile is in frame
    map.bg_prop.x = map.bg_prop.x - 800
    
  elseif player.x.pos <= window_x_min then
    -- move player out of window
    player.x.pos = 770
    map.bg_prop.x = map.bg_prop.x + 800
    
  end
end


Draw = {}

function Draw.Item(item)
  local offset = 25
  local r = 0 ;local g = 0;local b = 0
  image = love.graphics.newImage(item.image)
  
  if not item.is_collected then
    love.graphics.draw(image, item.x, item.y, 0, .3, .3)
  end

end

function Draw.Player(player)
  local player_sprite = love.graphics.newImage("Player.png")
  love.graphics.draw(player_sprite, player.x.pos, player.y.pos, 0, .5, .5)
end

function Draw.Coordinates(player, x, y)
  love.graphics.print(tostring(round(player.x.pos)).." "..tostring(round(player.y.pos)), x, y)
end

function Draw.Velocity(player, x, y)
  love.graphics.print(tostring(round(player.x.vel)).." "..tostring(round(player.y.vel)), x, y)
end

function Draw.Inventory(player, x, y)
  love.graphics.print("Inventory: ".. dump(player.inventory), 10, 30)
end

function Draw.Map(map)
  love.graphics.draw(map.background, 0, 0)
end
>>>>>>> 8fb0efde642918a887ce2a87621c2d6d54ec6656
