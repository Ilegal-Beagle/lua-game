
require "functions"
require "misc-functions"

function love.load()
  
  player = InitilizePlayer()
  
  map = {
    background  = love.graphics.newImage("background.png"),
    bg_prop  = { x=0, y=0 },
    avaliable_items = {
      {name = "Apple",  x = 100, y = 100, is_collected = false},
      {name = "Banana", x = 200, y = 200, is_collected = false},
      {name = "Orange", x = 300, y = 300, is_collected = false},
      {name = "Pear",   x = 400, y = 400, is_collected = false}
    }
  }
  
  io.stdout:setvbuf("no")
  
end

-- dt is delta time, this makes the movement same on all computers
function love.update(dt)
  
  MovePlayer(player, dt)

  AtEdge(player, map)
  
  for i, _ in pairs(map.avaliable_items) do
    ItemCheck(map.avaliable_items[i], player)
  end
end

function love.draw()

  Draw.Map(map)
  
  -- prints collectable items
  for i, _ in pairs(map.avaliable_items) do
    DrawItem(map.avaliable_items[i])
  end
  
  DrawPlayer(player)
  
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