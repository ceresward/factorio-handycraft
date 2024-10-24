-- Test update to prove it works
local itemCrudeMetalFurnace = data.raw["item"]["crude-metal-furnace"]
itemCrudeMetalFurnace.localised_description = itemCrudeMetalFurnace.localised_description.." (Updated by data-updates)"

-- Failed attempt to fix #1
local itemStoneFurnace = data.raw["item"]["stone-furnace"]
itemStoneFurnace.flags = itemStoneFurnace.flags or {}
table.insert(itemStoneFurnace.flags, "primary-place-result")

-- Failed attempt to fix #2
local entityStoneFurnace = data.raw["furnace"]["stone-furnace"]
entityStoneFurnace.localised_name = "Stone Furnace (updated by data-updates)"
entityStoneFurnace.placeable_by = {item="stone-furnace", count=1}