-- player.lua
-- stores information for the player

CreatePlayer{
    x  = { position = 400, velocity = 0, acceleration = 0},
    y = { position = 400, velocity = 0, acceleration = 0},

    image = "sprites/Player.png",
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
      if item:IsCollectable(self) then
          self:CollectItem(item)
      end
    end,
    
    TryCollectAllItems = function(self, items)
      for _, item in pairs(items) do
        self:TryCollectItem(item)
      end
    end,

    IsAtEdge = function(self, area)
      local window_x_max, window_y_max = love.graphics.getDimensions()
      local window_x_min, window_y_min = 0, 0
      local relocate_x_position, relocate_y_position = 30, 30
    
      if self:GetX() > window_x_max then
        return "right"
      elseif self:GetX() < window_x_min then
        return "left"
      elseif self:GetY() > window_y_max then
        return "down"
      elseif self:GetY() < window_y_min then
        return "up"
      else
        return nil
      end
    end,

    ChangeCurrentArea = function(self)

      if self:IsAtEdge(area) == "right" then
        self:SetX(30)
        self:SetArea()
    
      elseif self:IsAtEdge(area) == "left" then
        self:SetX(770)
        self:SetArea()
    
      elseif self:IsAtEdge(area) == "top" then
        self:SetY(0)
        self:SetArea()
    
      elseif self:IsAtEdge(area) == "bottom" then
        self:SetY(770)
        self:SetArea()
      end
    end,

    -- set methods

    SetX = function(self, x)
      self.x.position = x
    end,

    SetXVel = function(self, velocity)
      self.x.velocity = velocity
    end,

    SetXAcc = function(self, acceleration)
      self.x.acceleration = acceleration
    end,

    SetY = function(self, y)
      self.y.position = y
    end,

    SetYVel = function(self, velocity)
      self.y.velocity = velocity
    end,

    SetYAcc = function(self, acceleration)
      self.y.acceleration = acceleration
    end,

    SetArea = function(self, area_name)
      self.current_area = area_name
    end,

    -- get methods

    GetX = function(self)
      return self.x.position
    end,

    GetXVel = function(self)
      return self.x.velocity
    end,

    GetXAcc = function(self)
      return self.x.acceleration
    end,

    GetY = function(self)
      return self.y.position
    end,

    GetYVel = function(self)
      return self.y.velocity
    end,

    GetYAcc = function(self)
      return self.y.acceleration
    end,

    GetArea = function(self)
      return self.current_area
    end

  }