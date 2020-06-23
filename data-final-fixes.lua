--[[

The basic gist of the idea is that:
1. For each technology (with a recipe-unlock effect), create a dark version.
1.1 Dark techs require their "normal" counterpart, plus all the "dark" pre-reqs of the "normal" tech (this is the part that doesn't sound right when I write it down, I hope you get the point)
2. For each recipe-unlock, create a dark version (that links to 1).
3. Calculate energy cost of the recipe at run time based on original ingredients.
4. ??
5. Profit.

]]
require('prototypes.functions')

for _, k in pairs(data.raw.technology) do
  if k.effects then
    local make_tech = false
    for _, j in ipairs(k.effects) do
      if (j.type == 'unlock-recipe') then
        make_tech = true
      end
    end
    if make_tech then
      create_dark_technology(k.name)
    end
  end
end

-- loop through all recipes, get item-producing recipes
-- store as a reverse lookup table
local reverse_item_to_producing_recipe_lookup = {}
for _, k in pairs(data.raw.recipe) do
  if k.result then
    if (reverse_item_to_producing_recipe_lookup[k.result]) then
      table.insert(reverse_item_to_producing_recipe_lookup[k.result], k.name)
    else
      reverse_item_to_producing_recipe_lookup[k.result] = {k.name}
    end
  elseif k.results then
    for _, j in pairs(k.results) do
      if j.name then
        if (reverse_item_to_producing_recipe_lookup[j.name]) then
          table.insert(reverse_item_to_producing_recipe_lookup[j.name], k.name)
        else
          reverse_item_to_producing_recipe_lookup[j.name] = {k.name}
        end
      else
        -- log the recipe
        log('Cannot produce reverse lookup from ' .. k.name .. '.')
      end
    end
  end
end

-- loop through all techs, get recipe-unlock effects
-- store as a reverse lookup table
local reverse_recipe_to_unlocking_technology_lookup = {}
for _, k in pairs(data.raw.technology) do
  -- check if effects present
  if k.effects then
    for _, j in ipairs(k.effects) do
      if (j.type == 'unlock-recipe') then
        -- check to see if there is already a reverse lookup
        if (reverse_recipe_to_unlocking_technology_lookup[j.recipe]) then
          table.insert(reverse_recipe_to_unlocking_technology_lookup[j.recipe], k.name)
        else
          reverse_recipe_to_unlocking_technology_lookup[j.recipe] = {k.name}
        end
      end
    end
  end
end

local science_packs = {}
for _, k in pairs(data.raw.lab) do
  if k.inputs then
    for _, j in pairs(k.inputs) do
      science_packs[j] = true
    end
  end
end

--[[
  
create a bog standard "replication" tech, all replicaton techs require this as a pre-req
at each new science pack tech, allow a replication tier upgrade
all items that get unlocked by a science pack will have a comparible replication tech which allows the replication of said item

placable items (buildings etc) are locked behind a space science level tech which allows replication of entire buildings

for each item, generate a cost based on ingredients - cost essentially becomes time, fluids multiplier = 2

--]]
--Load the table of replication types
require('prototypes.repltypes')
--Extend the game's data with the replication type data
require('prototypes.repltypes-data')

--[[

if mods['bobelectronics'] then
  if data.raw.recipe['replication-lab'] then
    data.raw.recipe['replication-lab'].ingredients = {
      {'dark-matter-scoop', 5},
      {'basic-circuit-board', 10}, -- this being the only thing that changed
      {'copper-plate', 10},
      {'iron-plate', 10}
    }
    if data.raw.recipe['replicator-1'] then
      data.raw.recipe['replicator-1'].ingredients = {
        {'dark-matter-scoop', 15},
        {'basic-circuit-board', 10},
        {'copper-plate', 10},
        {'iron-plate', 10}
      }
    end
    if data.raw.recipe['replicator-2'] then
      data.raw.recipe['replicator-2'].ingredients = {
        {'dark-matter-scoop', 5},
        {'basic-circuit-board', 10},
        {'copper-plate', 10},
        {'iron-plate', 10}
      }
    end
    if data.raw.recipe['replicator-3'] then
      data.raw.recipe['replicator-3'].ingredients = {
        {'dark-matter-transducer', 4},
        {'basic-circuit-board', 10},
        {'copper-plate', 10},
        {'iron-plate', 10}
      }
    end
  end
end


--Create the replication table and establish the functions for editing it
require('prototypes.repltable.table-creation')

--Create the replication recipes
require('prototypes.replications.vanilla')
require('prototypes.replications.dark-tech')

--itemgroup
require('prototypes.item-groups')

-- add limitation to modules
for _, k in pairs(data.raw.module) do
  if (string.starts(k.name, 'productivity')) then
    table.insert(data.raw.module[k.name].limitation, 'dark-matter-transducer')
    table.insert(data.raw.module[k.name].limitation, 'matter-conduit')
  end
end

if bobmods then
  require('prototypes.replications.bob')
end
if angelsmods then
  require('prototypes.replications.angel')
end
if mods['aai-industry'] then
  require('prototypes.replications.aai-industry')
end
if mods['factorissimo2'] then
  require('prototypes.replications.factorissimo2')
end
if mods['yuoki'] then
  require('prototypes.replications.yuoki')
end
if mods['bio_industries'] then
  require('prototypes.replications.bio')
end

--Go through the tables of replications and calculate the numerical costs of all item replications
require('prototypes.repltable.process-costs')
--Go through the tables of replication technologies and sort out their prerequisite technologies
require('prototypes.repltable.process-prereqs')
--Parse the replication table and make the replications and their unlock technologies via the table's data
require('prototypes.repltable.process-actual-creation')

log(serpent.block(data.raw.technology['repl-079-gold']))
log(serpent.block(data.raw.technology['gold-processing']))
log(serpent.block(data.raw.technology['bob-gold-plate']))

--]]
