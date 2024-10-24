local crudeMetalFurnaceItem = {
  -- Copied from stone-furnace
  type = "item",
  name = "crude-metal-furnace",
  icon = "__base__/graphics/icons/stone-furnace.png",
  localised_name = "Crude Metal Furnace",
  localised_description = "A crude furnace crafted from metal, equivalent to a Stone Furnace",
  subgroup = "smelting-machine",
  order = "a[crude-metal-furnace]",
  inventory_move_sound = {filename="__base__/sound/item/metal-small-inventory-move.ogg", volume=0.8},
  pick_sound = {filename="__base__/sound/item/metal-small-inventory-pickup.ogg", volume=0.8},
  drop_sound = {filename="__base__/sound/item/metal-small-inventory-move.ogg", volume=0.8},
  place_result = "stone-furnace",
  stack_size = 50
}

local copperFurnaceRecipe = {
  type = "recipe",
  localised_name = "Crude Copper Furnace",
  localised_description = "Craft a crude furnace using iron plate",
  name = "copper-furnace",
  ingredients = {{type="item", name="copper-plate", amount=2}},
  results = {{type="item", name="crude-metal-furnace", amount=1}}
}

local ironFurnaceRecipe = {
  type = "recipe",
  name = "iron-furnace",
  localised_name = "Crude Iron Furnace",
  localised_description = "Craft a crude furnace using copper plate",
  ingredients = {{type="item", name="iron-plate", amount=2}},
  results = {{type="item", name="crude-metal-furnace", amount=1}}
}

data:extend {
  crudeMetalFurnaceItem, copperFurnaceRecipe, ironFurnaceRecipe
}