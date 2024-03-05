
require "functions"
require "misc-functions"

function love.load()
  
  player = InitilizePlayer()
  
  map = LoadArea()

  io.stdout:setvbuf("no")
  
end

-- dt is delta time, this makes the movement same on all computers
function love.update(dt)
  
  MovePlayer(player, dt)

  AtEdge(player, map)
  
  for i, _ in pairs(map.items) do
    ItemCheck(map.items[i], player)
  end
end

function love.draw()

  Draw.Map(map)
  
  -- prints collectable items
  for i, _ in pairs(map.items) do
    Draw.Item(map.items[i])
  end
  
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