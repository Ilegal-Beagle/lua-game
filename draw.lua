-- draw.lua
-- any functions that deals with drawing something will go here

Draw = {}

function Draw.Item(item)
  local scale = .3
  local r, g, b = 0, 0, 0
  image = love.graphics.newImage(item.image)
  
  if item.is_collected == false then
    love.graphics.draw(image, item.x, item.y, 0, scale, scale)
  end

end

-- draws all collectable items in area
function Draw.Items(items)
  for i, _ in pairs(items) do
    Draw.Item(items[i])
  end
end

function Draw.Player(player)
  local player_sprite = love.graphics.newImage(player.image)
  love.graphics.draw(player_sprite, player:GetX(), player:GetY(), 0, .5, .5)
end

function Draw.Coordinates(player, x, y)
  love.graphics.print(tostring(round(player:GetX())).." "..tostring(round(player:GetY())), x, y)
end

function Draw.Velocity(player, x, y)
  love.graphics.print(tostring(round(player:GetXVel())).." "..tostring(round(player:GetYVel())), x, y)
end

function Draw.Inventory(player, x, y)
  love.graphics.print("Inventory: ".. dump(player.inventory), 10, 30)
end

function Draw.Area(area)
  love.graphics.draw(area.background, area.bg_x, area.bg_y)
end

function Draw.currentArea(player, x ,y)
  love.graphics.print(player.current_area, x, y)
end