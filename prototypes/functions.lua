-- string.starts
function string.starts(String, Start)
  return string.sub(String, 1, string.len(Start)) == Start
end

-- create_dark_technology
function create_dark_technology(tech)
  --[[
    todo:
    - apply dark tint to technology icon/add dark matter icon overlay
    - apply localised_description ?
  --]]
  -- make local copy
  local dark_version = table.deepcopy(tech)
  -- change name
  dark_version.name = 'dark-tech-' .. tech.name
  -- change/add prerequisites
  if dark_version.prerequisites then
    dark_version.prerequisites = {}
    for _, k in pairs(tech.prerequisites) do
      local require = false
      if data.raw.technology[tostring(k)].effects then
        for _, j in pairs(data.raw.technology[tostring(k)].effects) do
          if j.type == 'unlock-recipe' then
            require = true
          end
        end
      end
      if require then
        table.insert(dark_version.prerequisites, 'dark-tech-' .. tostring(k))
      end
    end
    table.insert(dark_version.prerequisites, tech.name)
  else
    -- ground floor tech, require dark matter replication
    dark_version.prerequisites = {tech.name, dark_matter_replication_technology.name}
  end
  -- adjust recipe unlocks
  for _, j in ipairs(dark_version.effects) do
    if (j.type == 'unlock-recipe') then
      if temp_recipe_table[j.recipe] == nil then
        table.insert(temp_recipe_table, j.recipe)
      end
      j.recipe = 'dark-tech-' .. j.recipe
    end
  end
  -- add science pack requirement
  table.insert(dark_version.unit.ingredients, {dark_matter_science_pack_item.name, 1})

  -- add to table
  if dark_matter_technology_table[dark_version] == nil then
    table.insert(dark_matter_technology_table, dark_version)
  end
  --log(serpent.block(dark_version))
end

-- create_dark_recipe
function create_dark_recipe(recipe)
  --[[
    todo:
    - apply dark tint to technology icon/add dark matter icon overlay
    - apply localised_description ?
  --]]
  -- make local copy
  recipe = table.deepcopy(data.raw.recipe[recipe])
  local dark_version = table.deepcopy(recipe)
  --log(serpent.block(dark_version))
  -- change name
  dark_version.name = 'dark-tech-' .. recipe.name
  -- todo: add energy cost calculation based on ingredients (and maybe science requirements)
  -- add to table
  if dark_matter_recipe_table[dark_version] == nil then
    table.insert(dark_matter_recipe_table, dark_version)
  end
end
