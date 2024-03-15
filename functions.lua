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

function LoadPlayer(specified_area)
  local player = {}

  function CreatePlayer(b)
    player = b
    if specified_area then
      player.current_area = specified_area
    end
  end

  dofile("player.lua")

  return player
end

-- When the player goes to the edge of window,
-- it moves them to the opposite side of window
-- and changes their current position to next area
function AtEdge(player, area)
  local window_x_max, window_y_max = love.graphics.getDimensions()
  local window_x_min, window_y_min = 0
  local relocate_x_position, relocate_y_position = 30

  if player:GetX() > window_x_max then
    player.x.pos = 30
    player:SetArea("plains6")
    print("current area: ", player.current_area)
    
  elseif player:GetX() < window_x_min then
    player.y.pos = 770
    player:SetArea("plains5")
    print("current area: ", player.current_area)
  end
end