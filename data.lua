--Load some common functions used by the mod
require('prototypes.functions')

--Load the data for all the mod stuff except for the replications themselves
require('prototypes.raw-resources')
require('prototypes.condenser')
require('prototypes.matter-plate')
require('prototypes.intermediate-products')
require('prototypes.replicators')
require('prototypes.replication-lab')
require('prototypes.small-e-furnace')
require('prototypes.robotics')
require('prototypes.eridium')
require('prototypes.pumpjack')
--require("prototypes.mass-e-furnace") (Not able to be created due to source inventory limitation on furnace) Maybe in the future
require('prototypes.solar')
require('prototypes.accumulator')

--technologies
require('prototypes.technologies.dark-tech-electricity')
require('prototypes.technologies.dark-tech-logistic-robots')

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
require('config')
require('prototypes.sounds.sounds')

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
log(serpent.block(data.raw.technology['repl-steel-plate']))
log(serpent.block(voiceStyle))
