-- main file
require "functions"
require "misc-functions"
require "draw"
require "movement"

CONST_BEGIN_AREA = "plains5"

function love.load()
<<<<<<< HEAD

  player = LoadPlayer()
  area = LoadArea(CONST_BEGIN_AREA)
  map_array = {
    {place = "plains1"}, {place = "plains2"}, {place = "plains3"},
    {place = "plains4"}, {place = "plains5"}, {place = "plains6"},
    {place = "plains7"}, {place = "plains8"}, {place = "plains9"}
  }

=======
  
  player = InitilizePlayer()
  
  map = LoadArea()

>>>>>>> 8fb0efde642918a887ce2a87621c2d6d54ec6656
  io.stdout:setvbuf("no")
  
end

-- dt is delta time, this makes the movement same on all computers
function love.update(dt)

  MovePlayer(player, dt)

<<<<<<< HEAD
  player.TryCollectAllItems(area)

  AtEdge(player, area)
  
=======
  AtEdge(player, map)
  
  for i, _ in pairs(map.items) do
    ItemCheck(map.items[i], player)
  end
>>>>>>> 8fb0efde642918a887ce2a87621c2d6d54ec6656
end

function love.draw()

<<<<<<< HEAD
  Draw.Area(area)
  Draw.Items(area)
  Draw.Player(player)
  
=======
  Draw.Map(map)
  
  -- prints collectable items
  for i, _ in pairs(map.items) do
    Draw.Item(map.items[i])
  end
  
  Draw.Player(player)
  
>>>>>>> 8fb0efde642918a887ce2a87621c2d6d54ec6656
  Draw.Coordinates(player, 10, 0)
  Draw.Velocity(player, 10, 15)
  Draw.Inventory(player, 10, 30)
  
end


function love.keyreleased(key)
  if key == 'e' then
    table.remove(player.inventory)
  end
  if key == 'f' then
    end
end