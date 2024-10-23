local COUNT_ALL = 'all'

---Find all player-craftable recipes that produce as a main product items that match using the provided match function
---@param player LuaPlayer
---@param fnMatch function match function taking as input the main product's item prototype name 
---@return table
local function findPlayerCraftableRecipesMatching(player, fnMatch)
  local force = player.force --[[@as LuaForce]]

  ---@param recipe LuaRecipe
  local function isPlayerCraftable(recipe)
    return not force.get_hand_crafting_disabled_for_recipe(recipe)
      and not recipe.prototype.hidden_from_player_crafting
      and not recipe.prototype.hide_from_player_crafting
  end

  local results = {}
  for _, recipe in pairs(force.recipes) do
    if isPlayerCraftable(recipe)
      and recipe.prototype.main_product and recipe.prototype.main_product.type == "item"
      and fnMatch(recipe.prototype.main_product.name)
    then
      table.insert(results, recipe)
    end
  end
  return results
end

---Determines if an entity is placeable using the given item prototype name
---@param entityPrototype LuaEntityPrototype
---@param itemPrototypeName string
local function isEntityPlaceableUsing(entityPrototype, itemPrototypeName)
  if not entityPrototype.items_to_place_this then return false end

  for _, itemStackDefinition in pairs(entityPrototype.items_to_place_this) do
    if itemStackDefinition.name == itemPrototypeName then return true end
  end
  return false
end

---Identify the most appropriate recipe (if any) to be crafted based on the current player state
---@param player LuaPlayer player
---@return LuaRecipe?
local function getRecipeToCraft(player)
  -- Figuring out the recipe is surprisingly difficult.  First, this method needs to determine the item(s) to target,
  -- based on the player's cursor stack or selected entity (note: the selected entity may be placeable by multiple items).  Next, a search needs to be performed on the recipe
  -- list stored in the player's force to find all hand-craftable recipes that produce the target item as a main
  -- product.  Finally, a recipe needs to be selected from the list to use to attempt crafting (most of the time,
  -- an item will only have one recipe that produces it.  But it's possible for mods to define multiple recipes that
  -- produce the same main product.)

  -- 1. Identify the item(s) to target
  local fnMatch  --- @type function

  -- game.print('Cursor stack: '..serpent.line(player.cursor_stack))
  -- game.print('Cursor ghost: '..serpent.line(player.cursor_ghost))
  -- game.print('Selected: '..serpent.line(player.selected))

  ---@type LuaItemPrototype
  local targetItemPrototype = (player.cursor_stack and player.cursor_stack.valid_for_read and player.cursor_stack.prototype)
    or (player.cursor_ghost and player.cursor_ghost.name) --[[@as LuaItemPrototype]]
  if targetItemPrototype and targetItemPrototype.object_name == 'LuaItemPrototype' then
    fnMatch = function(name) return targetItemPrototype.name == name end
  else
    local targetEntityPrototype = player.selected and (
      (player.selected.type == "entity-ghost" and player.selected.ghost_prototype)
        or (player.selected.prototype)
    ) --[[@as LuaEntityPrototype]]
    if targetEntityPrototype and targetEntityPrototype.object_name == 'LuaEntityPrototype' then
      fnMatch = function(name) return isEntityPlaceableUsing(targetEntityPrototype, name) end
    -- else
      -- game.print('No item or entity found to target')
    end
  end

  -- 2. Get list of hand-craftable recipes that produce the target item
  local matchingRecipes = (fnMatch and findPlayerCraftableRecipesMatching(player, fnMatch)) or {}
  -- game.print('Matching recipes: '..serpent.line(matchingRecipes))

  -- 3. Select a recipe to use from the list
  --    Current rule:  pick the recipe that has the highest "craftable count"
  if #matchingRecipes == 1 then
    return matchingRecipes[1]
  elseif #matchingRecipes > 1 then
    ---@param recipe1 LuaRecipe first recipe
    ---@param recipe2 LuaRecipe second recipe
    local function sortRecipes(recipe1, recipe2)
      return player.get_craftable_count(recipe1) > player.get_craftable_count(recipe2)
    end
    table.sort(matchingRecipes, sortRecipes)
    return matchingRecipes[1]
  end
end

---@param player LuaPlayer player
---@param count integer|string count
local function handyCraft(player, count)
  local recipe = getRecipeToCraft(player)
  if not recipe then return end

  local actual_count = (count == COUNT_ALL and player.get_craftable_count(recipe))
    or count --[[@as integer]]

  player.begin_crafting { count=actual_count, recipe=recipe }
end

local function handyCraftSingle(event)
  local player = game.get_player(event.player_index)
  if not player then return end

  handyCraft(player, 1)
end

local function handyCraftMultiple(event)
  local player = game.get_player(event.player_index)
  if not player then return end

  handyCraft(player, 5)
end

local function handyCraftAll(event)
  local player = game.get_player(event.player_index)
  if not player then return end

  handyCraft(player, COUNT_ALL)
end

script.on_event("handy-craft-single", handyCraftSingle)
script.on_event("handy-craft-multiple", handyCraftMultiple)
script.on_event("handy-craft-all", handyCraftAll)