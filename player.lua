-- player.lua
-- stores information for the player

function CreatePlayer(b)
    player = b
  end

CreatePlayer{
    x  = { pos = 400, vel = 0, acc = 0},
    y = { pos = 400, vel = 0, acc = 0},

    image = "Player.png",
    friction  = .3,
    stopping_acceleration = 900,
    starting_acceleration = 900,
    max_velocity = 300,
    hitbox = 0,
    inventory = {},

    CollectItem = function(self, item)
      table.insert(self.inventory, item)
      item.is_collected = true
    end,

    TryCollectItem = function(self, item)
      if item:IsCollectable(player) then
          player:CollectItem(item)
      end
    end,
    
    TryCollectAllItems = function(area)
      for _, item in pairs(area.items) do
        player:TryCollectItem(item)
      end
    end
  }