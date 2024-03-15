-- area.lua
-- Stores the information of an area

function CreateItem(name, image, arg_x, arg_y)
    if not name and  not image and not x and not y then
        print("arguments are not given")
    else
        local item = {
            name = name,
            image = image,
            x = arg_x,
            y = arg_y,
            is_collected = false,

            IsTouching = function(self, player)
                if player.x.pos > self.x and player.x.pos < (self.x + 50) and
                   player.y.pos > self.y and player.y.pos < (self.y + 50) then
                    return true else return false
                end
            end,

            IsCollectable = function(self, player)
                if self:IsTouching(player) and not self.is_collected then
                    return true else return false
                end
            end
        }
        return item
    end
  end

-- first area
CreateArea {
    area_name  = "plains5",
    background = "background.png",
    bg_x = 0,
    bg_y = 0,

    items = {
    CreateItem("Apple", "apple.png", 100, 100),
    CreateItem("Banana", "banana.png", 200, 200),
    CreateItem("Orange", "orange.png", 300, 300),
    CreateItem("Pear", "pear.png", 400, 400)
    }
}

-- second area
CreateArea {
    area_name  = "plains6",
    background = "ActionCube_game_800x600.jpg",
    bg_x = 800,
    bg_y = 0,
    
    items = {
    CreateItem("Apple", "apple.png", 100, 50),
    CreateItem("Banana", "banana.png", 200, 300),
    CreateItem("Orange", "orange.png", 150, 400),
    CreateItem("Pear", "pear.png", 500, 350)
    }
  }