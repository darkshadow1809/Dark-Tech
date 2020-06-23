--[[

The basic gist of the idea is that:
1. For each technology (with a recipe-unlock effect), create a dark version.
1.1 Dark techs require their "normal" counterpart, plus all the "dark" pre-reqs of the "normal" tech (this is the part that doesn't sound right when I write it down, I hope you get the point)
2. For each recipe-unlock, create a dark version (that links to 1).
3. Calculate energy cost of the recipe at run time based on original ingredients.
4. ??
5. Profit.

NOTES FOR SOBER ME

Optional mod dependancies are required to get mod load order correct

]]
-- temp table to hold recipe pointers
temp_recipe_table = {}

-- tables to store data to extend
dark_matter_technology_table = {}
dark_matter_recipe_table = {}

require('prototypes.functions')

-- todo: move to prototype.technology
dark_matter_replication_technology = {
  effects = nil,
  icon = '__base__/graphics/technology/automation.png',
  icon_size = 128,
  name = 'dark-tech-matter-replication',
  order = 'a-b-a',
  type = 'technology',
  unit = {
    count = 10,
    ingredients = {
      {
        'dark-matter-science-pack', -- change to dark-matter-science pack
        1
      }
    },
    time = 10
  }
}
--[[
  todo:
  - add prerequisite for dark-matter-science-pack
  - add recipe for science pack
    - require tenemut/dark matter ore
  - tint space science pack/overlay icon
--]]
dark_matter_science_pack_item = {
  type = 'tool',
  name = 'dark-matter-science-pack',
  localised_description = {'item-description.science-pack'},
  --icon = 'graphics/icons/dark-matter-science-pack.png',
  icon = '__base__/graphics/icons/space-science-pack.png',
  icon_size = 64,
  icon_mipmaps = 4,
  subgroup = 'science-pack',
  order = 'a[dark-matter-science-pack]',
  stack_size = 200,
  durability = 1,
  durability_description_key = 'description.science-pack-remaining-amount-key',
  durability_description_value = 'description.science-pack-remaining-amount-value'
}

dark_matter_science_pack_recipe = {
  type = 'recipe',
  name = dark_matter_science_pack_item.name,
  energy_required = 5,
  ingredients = {
    {'iron-plate', 1},
    {'iron-gear-wheel', 1}
  },
  result = dark_matter_science_pack_item.name
}

-- loop techs
for _, k in pairs(data.raw.technology) do
  --log(k.name)
  if k.effects then
    local make_tech = false
    for _, j in ipairs(k.effects) do
      if (j.type == 'unlock-recipe') then
        make_tech = true
      end
    end
    if make_tech then
      create_dark_technology(k)
    end
  end
end
-- loop recipes
for _, k in pairs(temp_recipe_table) do
  --log(k)
  create_dark_recipe(k)
end

for _, k in pairs(dark_matter_technology_table) do
  data:extend {k}
end

for _, k in pairs(dark_matter_recipe_table) do
  data:extend {k}
end

data:extend {dark_matter_replication_technology, dark_matter_science_pack_item, dark_matter_science_pack_recipe}
