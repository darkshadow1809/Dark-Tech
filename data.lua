--Load some common functions used by the mod
require('prototypes.functions')

--Load the data for all the mod stuff except for the replications themselves
require('prototypes.raw-resources')
--require('prototypes.matter-plate')
require('prototypes.intermediate-products')
require('prototypes.replicators')
require('prototypes.replication-lab')
require('prototypes.small-e-furnace')
require('prototypes.eridium')
require('prototypes.pumpjack')
require('prototypes.solar')
require('prototypes.accumulator')

--technologies
require('prototypes.technologies.dark-tech-electricity')

--Load the table of replication types
require('prototypes.repltypes')
--Extend the game's data with the replication type data
require('prototypes.repltypes-data')
--Create the replication table and establish the functions for editing it
require('prototypes.repltable.table-creation')

--Create the replication recipes
require('prototypes.replications.vanilla')
require('prototypes.replications.dark-tech')

--itemgroup
require('prototypes.item-groups')

--sounds
--require('config')
--require('prototypes.sounds.sounds')

-- add limitation to modules

local intermediate_recipes = {'dark-matter-transducer', 'matter-conduit'}

for _, module in pairs(data.raw.module) do
  if module.effect['productivity'] and module.limitation then
    for _, recipe_name in pairs(intermediate_recipes) do
      table.insert(module.limitation, recipe_name)
    end
  end
end
table.insert(data.raw['module']['productivity-module'].limitation, 'dark-matter-scoop')
table.insert(data.raw['module']['productivity-module-2'].limitation, 'dark-matter-scoop')
table.insert(data.raw['module']['productivity-module-3'].limitation, 'dark-matter-scoop')
if bobsmods then
  table.insert(data.raw['module']['productivity-module-4'].limitation, 'dark-matter-scoop')
  table.insert(data.raw['module']['productivity-module-5'].limitation, 'dark-matter-scoop')
end
table.insert(data.raw['module']['productivity-module'].limitation, 'matter-conduit')
table.insert(data.raw['module']['productivity-module-2'].limitation, 'matter-conduit')
table.insert(data.raw['module']['productivity-module-3'].limitation, 'matter-conduit')
if bobsmods then
  table.insert(data.raw['module']['productivity-module-4'].limitation, 'matter-conduit')

  table.insert(data.raw['module']['productivity-module-5'].limitation, 'matter-conduit')
end

if bobmods then
  require('prototypes.replications.bob')
end
if angelsmods then
  require('prototypes.replications.angel')
end
if data.raw.item['small-iron-electric-pole'] then
  require('prototypes.replications.aai-industry')
end
if data.raw.item['factory-1'] then
  require('prototypes.replications.factorissimo2')
end
if data.raw.item['y-raw-fuelnium'] then
  require('prototypes.replications.yuoki')
end
if data.raw.item['bi_bio_farm'] then
  require('prototypes.replications.bio')
end
--log(serpent.block(data.raw.technology['repl-steel-plate']))
--log(serpent.block(voiceStyle))
