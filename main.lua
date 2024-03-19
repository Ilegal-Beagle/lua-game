-- main file
require "functions"
require "misc-functions"
require "draw"
require "movement"

function love.load()
  player = LoadPlayer("player.lua")
  player.current_area = "plains4"

  -- MAP = LoadMap("map.lua")
  area = LoadArea(player.current_area)
  previous_area = player.current_area

  io.stdout:setvbuf("no")
end

-- dt is delta time, this makes the movement same on all computers
function love.update(dt)

  MovePlayer(player, dt)

  player:TryCollectAllItems(area)
  player:ChangeCurrentArea()
  
  previous_area = area.area_name

end

function love.draw()

  Draw.Area(area)
  Draw.Player(player)
  Draw.Items(area.items)
  
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