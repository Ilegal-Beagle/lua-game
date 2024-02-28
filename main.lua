
require "functions"

function love.load()
  
  player = {
    x     = 400,
    y     = 400,
    speed = 100,
    inventory = {}
  }

  -- TESTING STUFF HERE
  bg_prop  = {}
  bg2_prop = {}
  bg_prop.x, bg_prop.y = 0
  bg2_prop.x = 800
  bg2_prop.y = 0
  
  avaliable_items = {
    {name = "Apple",  x = 100, y = 100, is_collected = false},
    {name = "Banana", x = 200, y = 200, is_collected = false},
    {name = "Orange", x = 300, y = 300, is_collected = false},
    {name = "Pear",   x = 400, y = 400, is_collected = false}
    }
  
  io.stdout:setvbuf("no")
  
  background  = love.graphics.newImage("background.png")
  background2 = love.graphics.newImage("background2.png")
  
end

-- dt is delta time, this makes the movement same on all computers
function love.update(dt)
  
  PlayerMovement(player, dt)
  
  AtEdge(player, bg_prop, bg2_prop)
  
  for i, _ in pairs(avaliable_items) do
    ItemCheck(avaliable_items[i], player)
  end
end

function love.draw()
  
  -- draws the backgrounds
    love.graphics.draw(background, bg_prop.x, bg_prop.y)
    love.graphics.draw(background2, bg2_prop.x, bg2_prop.y)
  

  -- prints collectable items
  for i, _ in pairs(avaliable_items) do
    DrawItem(avaliable_items[i])
  end
  

  DrawPlayer(player)
  
  
  -- draws player coords and player inventory
  love.graphics.print(tostring(round(player.x)).." "..tostring(round(player.y)), 10)
  love.graphics.print("Inventory: "..dump(player.inventory), 10, 20)
  
end


function love.keyreleased(key)
  if key == 'e' then
    table.remove(player.inventory)
  end
  if key == 'f' then
    end
end




