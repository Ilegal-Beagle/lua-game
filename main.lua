-- main file
require "functions"
require "misc-functions"
require "draw"
require "movement"
require "player"
require "area"

CONST_BEGIN_AREA = "plains5"

function love.load()
  area = LoadArea(CONST_BEGIN_AREA)
  player = LoadPlayer()
  map_array = {
    {place = "plains1"}, {place = "plains2"}, {place = "plains3"},
    {place = "plains4"}, {place = "plains5"}, {place = "plains6"},
    {place = "plains7"}, {place = "plains8"}, {place = "plains9"}
  }
  
  player = InitilizePlayer()
  
  map = LoadArea()

  io.stdout:setvbuf("no")
end

-- dt is delta time, this makes the movement same on all computers
function love.update(dt)

  MovePlayer(player, dt)
  player.TryCollectAllItems(area)

  AtEdge(player, area)
end

function love.draw()

  Draw.Area(area)
  Draw.Items(area)
  Draw.Player(player)
  
  Draw.Map(map)
  
  Draw.Player(player)
  
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