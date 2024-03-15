-- functions.lua
-- various functions that need to be organized into seperate files

-- functions to load from file

function LoadArea(specified_area)
  local area = {}
  
  -- copies info of chunk from area.lua to area
  print(specified_name)
  function CreateArea(b)
    print(specified_name, b.area_name)
    if specified_area == b.area_name then
      area = b
      area.background = b.background
    else
      print("Area {} not in file!!", specified_area)
    end
  end
  
      -- loads and executes area.lua
  dofile("area.lua")
  

  -- make background a love image
  if area == nil then
    print("Area not initilized correctly")
  else
    area.background = love.graphics.newImage(area.background)
  end

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