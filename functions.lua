-- functions.lua
-- various functions that need to be organized into seperate files

-- functions to load from file

function LoadArea(specified_area)
  local area = {}

  function CreateArea(b)
    if specified_area == b.area_name then
      area = b
      area.background = love.graphics.newImage(area.background)
    end
  end

  function CreateItem(arg_name, arg_image, arg_x, arg_y)
    if not arg_name and not arg_image and not arg_x and not arg_y then
      print("arguments are not given")
    else
      local item = {
        name = arg_name,
        image = arg_image,
        x = arg_x,
        y = arg_y,
        is_collected = false,

        IsTouching = function(self, player)
          if player.x.pos > self.x and player.x.pos < (self.x + 50) and
              player.y.pos > self.y and player.y.pos < (self.y + 50) then
            return true
          else return false
          end
        end,

        IsCollectable = function(self, player)
          if self:IsTouching(player) and not self.is_collected then
            return true
          else return false
          end
        end
      }
      return item
    end
  end

  dofile("area.lua")

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