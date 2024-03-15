-- area.lua
-- Stores the information of an area

  -- first area
  CreateArea {
    area_name  = "plains5",
    background = "background.png",
    bg_x       = 0,
    bg_y       = 0,
  
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
    bg_x       = 0,
    bg_y       = 0,
  
    items = {
      CreateItem("Apple", "apple.png", 100, 50),
      CreateItem("Banana", "banana.png", 200, 300),
      CreateItem("Orange", "orange.png", 150, 400),
      CreateItem("Pear", "pear.png", 500, 350)
    }
  }
  
  