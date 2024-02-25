
function DrawPlayer(player)
  local player_sprite = love.graphics.newImage("Player.png")
  love.graphics.draw(player_sprite, player.x, player.y, 0, .5, .5)
end

function PlayerMovement(player, dt)
  
  if love.keyboard.isDown("right") then
    player.x = player.x + player.speed*dt
  end
    
  if love.keyboard.isDown("left") then
    player.x = player.x - player.speed*dt
  end
    
  if love.keyboard.isDown("down") then
    player.y = player.y + player.speed*dt
  end
  
  if love.keyboard.isDown("up") then
    player.y = player.y - player.speed*dt
  end
  
end
  
-- Checks if item has been touched by player
-- If item is collected, remmoves it from field
-- and added to player inventory
function ItemCheck(item, player)
  if player.x > item.x and player.x < (item.x + 50) and 
     player.y > item.y and player.y < (item.y + 50) then
    if not item.is_collected then
      table.insert(inventory, item)
      item.is_collected = true
    end
  end
end
  
  
function round(num, place)
  local multi = 10^(place or 0)
  return math.floor(num * multi + .5) / multi
end

function dump(o)
   if type(o) == 'table' then
      local s = ''
      for k,v in pairs(o) do
        s = s .. v.name .. ' '
      end
      return s
   else
      return tostring(o)
   end
end

function DrawItem(item)
  local offset = 25
  local r = 0 ;local g = 0;local b = 0
  image = love.graphics.newImage(item.name..".png")
  
  if item.is_collected then
    return
  end

  love.graphics.draw(image, item.x, item.y, 0, .3, .3)
end
