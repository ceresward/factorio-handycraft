local handyCraftSingle = {
  type = "custom-input",
  name = "handy-craft-single",
  localised_name = nil, -- Defined in locale cfg files
  localised_description = nil, -- Defined in locale cfg files
  key_sequence = "ALT + Q",
  action = "lua",
}

local handyCraftMultiple = {
  type = "custom-input",
  name = "handy-craft-multiple",
  localised_name = nil, -- Defined in locale cfg files
  localised_description = nil, -- Defined in locale cfg files
  key_sequence = "SHIFT + ALT + Q",
  action = "lua",
}

local handyCraftAll = {
  type = "custom-input",
  name = "handy-craft-all",
  localised_name = nil, -- Defined in locale cfg files
  localised_description = nil, -- Defined in locale cfg files
  key_sequence = "CONTROL + SHIFT + ALT + Q",
  action = "lua",
}

data:extend{
  handyCraftSingle, handyCraftMultiple, handyCraftAll
}