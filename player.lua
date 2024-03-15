-- player.lua
-- stores information for the player

CreatePlayer{
    x  = { pos = 400, vel = 0, acc = 0},
    y = { pos = 400, vel = 0, acc = 0},

    image = "Player.png",
    friction  = .3,
    stopping_acceleration = 900,
    starting_acceleration = 900,
    max_velocity = 300,
    hitbox = 0,
    current_area = "plains5",
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
    end,

    SetX = function(self, x)
      self.x.pos = x
    end,

    SetY = function(self, y)
      self.y.pos = y
    end,

    SetArea = function(self, area_name)
      self.current_area = area_name
    end,

    GetX = function(self)
      return self.x.pos
    end,

    GetY = function(self)
      return self.y.pos
    end,

    GetArea = function(self)
      return self.current_area
    end

  }