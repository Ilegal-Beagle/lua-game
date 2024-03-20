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
          if player:GetX() > self.x and player:GetX() < (self.x + 50) and
              player:GetY() > self.y and player:GetY() < (self.y + 50) then
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

function LoadPlayer(file)
  local player = {}

  function CreatePlayer(b)
    player = b
  end

  dofile(file)

  return player
end

function LoadMap()
  local MAP = {}
  local placement =
  {"plains1", "plains2", "plains3",
   "plains4", "plains5", "plains6",
   "plains7", "plains8", "plains9"}

    
  -- making a 3*3 grid of nodes, all will have edges to the
  -- ones above, below, left, and right of node in question
  local MAP = require("luagraphs.data.graph").create(9)

  MAP:addEdge(0 ,3)
  MAP:addEdge(0 ,1)
  MAP:addEdge(1 ,4)
  MAP:addEdge(1 ,2)
  MAP:addEdge(2 ,5)
  MAP:addEdge(3 ,6)
  MAP:addEdge(3 ,4)
  MAP:addEdge(4 ,7)
  MAP:addEdge(4 ,5)
  MAP:addEdge(5 ,8)
  MAP:addEdge(6 ,7)
  MAP:addEdge(7 ,8)
  
for k = 0, MAP:vertexCount() -1 do  -- iterate through all the vertices in g
    local vertex = MAP:vertexAt(k)  -- current vertex
    local adj_v = MAP:adj(vertex)   -- adjacency list for vertex v
    local area = placement[k+1]     -- current area to load into vertex
    
    -- put area into repsective graph
    MAP.vertexValues[k] = LoadArea(area)
    
    
    -- print adjacency list
    --[[
    local text = tostring(MAP.vertexValues[k].area_name)..": "
    for i = 0, adj_v:size()-1 do
        text = text .. adj_v:get(i):other(vertex) .. ', '
    end
    print(text)
    ]]--
end

end
