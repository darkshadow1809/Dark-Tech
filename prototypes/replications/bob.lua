--Bob's mods add more efficient machines which are so much more efficient that the replication costs of certain forms of processing are reduced
replvar('', 5 / 9) --Assembling machine 4 (the new most efficient one)
replvar('smelting', 75 / 270) --Electric chemical mixing furnace 2
replvar('oil-processing', 10 / 7) --Oil refinery 4
replvar('chemistry', 32 / 63) --Chemical plant 4
--Processing costs for new forms of processing
replvar('air-pump', 7 / 54) --Air Pump 4
replvar('distillery', 2 / 3) --Distillery
replvar('electrolysis', 3 / 5) --Electrolyser 4
replvar('electronics', 1 / 3) --Electronics machine 3
replvar('electronics-machine', 1 / 3) --Electronics Machine 3
replvar('mixing-furnace', 75 / 270) --Electric chemical mixing furnace 2
replvar('chemical-furnace', 75 / 270) --Electric chemical mixing furnace 2

if bobmods.ores or bobmods.plates then
  --Ore cost multipliers are based on both the rarity and the mining time of the ore, with those two values being multiplied together.
  --Rarity is not an actual numerical value so these costs are fudged a bit.
  --Let's go with mining time / richness / size.
  --Vanilla ores have a mining time of 2, a richness of 1.25 and a size of 1.125.  So the commented out values are to be multiplied by 0.703125.
  repltech_ore('bauxite-ore', 1.171875) --2/0.8/1.5
  repltech_ore('cobalt-ore', 2.9296875) --2.5/0.6/1
  replvar('gem-ore', 14.0625) --2/0.1/1
  repltech_ore('gold-ore', 1.171875) --2/1.2/1
  repltech_ore('lead-ore', 0.87890625) --1.5/1.2/1
  repltech_ore('nickel-ore', 1.46484375) --2/0.8/1.2
  repltech_ore('quartz', 1.40625) --2/1/1
  repladd_recipe('quartz', 'quartz-glass')
  repltech_ore('rutile-ore', 1.171875) --2/0.8/1.5
  repltech_ore('silver-ore', 0.87890625) --1.5/1.2/1
  --	repltech_ore("sulfur", 0.703125) --1/1/1
  --	repltech_ore("thorium-ore", 5.2734375) --3/0.5/0.8
  repltech_ore('tin-ore', 0.78125) --2/1.2/1.5
  repltech_ore('tungsten-ore', 1.46484375) --2/0.8/1.2
  repltech_ore('zinc-ore', 1.171875) --2/1/1.2
  repladd_item('water', 'lithia-water', {target = 'ore', type = 'var', multiplier = 0.02})

  if bobmods.plates then
    --Modify the replicators so that they use Bob plates
    local ingredients
    ingredients = data.raw.recipe['replicator-2'].ingredients
    ingredients[#ingredients + 1] = {'gold-plate', 2}
    ingredients = data.raw.recipe['replicator-3'].ingredients
    ingredients[#ingredients + 1] = {'gold-plate', 4}
    ingredients = data.raw.recipe['replicator-4'].ingredients
    ingredients[#ingredients + 1] = {'tungsten-plate', 2}
    ingredients = data.raw.recipe['replicator-5'].ingredients
    ingredients[#ingredients + 1] = {'tungsten-plate', 4}

    --Modify the prerequisites of related technologies
    local prerequisites
    prerequisites = data.raw.technology['replication-2'].prerequisites
    prerequisites[#prerequisites + 1] = 'gold-processing'
    prerequisites = data.raw.technology['replication-4'].prerequisites
    prerequisites[#prerequisites + 1] = 'tungsten-processing'

    --Plates and elemental fluids
    repltech_element(1, 'hydrogen', {replsub_item('hydrogen', {{target = 'water', type = 'item', multiplier = 0.5}, {target = 'electrolysis', type = 'var', multiplier = 0.5}})}, 'water')

    --Like all elements, lithium itself is a tier 2 replication.  But becuase it requires lithium chloride, a chemical (tier 3), as a prerequisite, lithium replication cannot be researched before tier 3.  This sort of thing it true for many of the more advanced Bob elements.
    repltech_recipe('lithium-chloride', 'chemical')
    repltech_element(3, 'lithium', {replsub_recipe('lithium')}, nil, 'lithium')

    if bobmods.ores then
      repltech_element(6, 'carbon', {replsub_recipe('carbon'), replsub_item('diamond-ore', {target = 'gem-ore', type = 'var', multiplier = 1 / bobmods.gems.DiamondRatio})}, nil, 'carbon')
      repltech_item_table({replsub_recipe('bob-diamond-3'), replsub_recipe('bob-diamond-4')}, 'shape', 'bob-diamond-3', {localized_name = {'technology-name.repl-diamond'}, internal_name = 'diamond'})
    else
      repltech_element(6, 'carbon', {replsub_recipe('carbon')}, nil, 'carbon')
    end

    repltech_item('liquid-air', 'ore', 'bob-liquid-air')
    repltech_element(7, 'nitrogen', {replsub_recipe('nitrogen')}, 'liquid-air')

    repltech_element(8, 'oxygen', {replsub_item('oxygen', {{target = 'hydrogen', type = 'item', multiplier = 2}})}, 'water')

    repltech_recipe('alumina', 'chemical')
    repltech_element(13, 'aluminium', {replsub_recipe('bob-aluminium-plate')}, nil, 'bob-aluminium-plate')

    repltech_recipe('hydrogen-chloride', 'chemical')
    repltech_recipe('calcium-chloride', 'chemical')
    repltech_element(14, 'silicon', {replsub_recipe('bob-silicon-plate'), replsub_recipe('silicon-powder')}, nil, 'bob-silicon-plate')

    repltech_recipe('salt', 'ore')
    repltech_item('sodium-hydroxide', 'chemical', {{target = 'salt-water-electrolysis', type = 'recipe-noproduct', multiplier = 0.5}}, 'salt-water-electrolysis')
    repltech_element(17, 'chlorine', {replsub_item('chlorine', {{target = 'salt-water-electrolysis', type = 'recipe-noproduct', multiplier = 0.5 / 25}})}, nil, 'salt-water-electrolysis')

    repltech_element(22, 'titanium', {replsub_recipe('bob-titanium-plate')}, nil, 'bob-titanium-plate')
    repltech_recipe('titanium-gear-wheel', 'shape')

    repltech_recipe('cobalt-oxide', 'chemical')
    repltech_element(27, 'cobalt', {replsub_recipe('cobalt-plate')}, nil, 'cobalt-plate')

    repltech_element(28, 'nickel', {replsub_item('nickel-plate', {target = 'bob-nickel-plate', tye = 'recipe-noproduct'})}, nil, 'bob-nickel-plate')

    repltech_element(30, 'zinc', {replsub_recipe('bob-zinc-plate')}, nil, 'bob-zinc-plate')

    repltech_element(47, 'silver', {replsub_recipe('silver-plate')}, nil, 'silver-plate')

    repltech_element(50, 'tin', {replsub_recipe('tin-plate')}, nil, 'tin-plate')

    --Tungsten goes a step further and requires tier 4 to be reached.
    repltech_recipe('tungstic-acid', 'chemical')
    repltech_recipe('tungsten-oxide', 'chemical', {tier = 4})
    repltech_element(74, 'tungsten', {replsub_recipe('powdered-tungsten'), replsub_recipe('bob-tungsten-plate')}, nil, {'powdered-tungsten', 'bob-tungsten-plate'})
    repltech_recipe('tungsten-gear-wheel', 'shape')

    repltech_element(79, 'gold', {replsub_recipe('bob-gold-plate')}, nil, 'bob-gold-plate')

    repltech_recipe('lead-oxide', 'chemical')
    repltech_element(82, 'lead', {replsub_recipe('bob-lead-plate')}, nil, 'bob-lead-plate')

    --Gems
    if bobmods.ores then
      replvar('silicon-carbide')
      replvar('grinding-wheel')
      replvar('polishing-wheel')
      repltech_recipe('polishing-compound', 'chemical')
      repltech_item_table({replsub_item('ruby-ore', {target = 'gem-ore', type = 'var', multiplier = 1 / bobmods.gems.RubyRatio}), replsub_recipe('bob-ruby-3'), replsub_recipe('bob-ruby-4')}, 'chemical', {{target = 'oxygen', type = 'item'}, {target = 'aluminium-plate', type = 'item'}, {target = 'silicon', type = 'item'}}, {localized_name = {'technology-name.repl-ruby'}, internal_name = 'ruby'})
      repltech_item_table({replsub_item('sapphire-ore', {target = 'gem-ore', type = 'var', multiplier = 1 / bobmods.gems.SapphireRatio}), replsub_recipe('bob-sapphire-3'), replsub_recipe('bob-sapphire-4')}, 'chemical', {{target = 'oxygen', type = 'item'}, {target = 'aluminium-plate', type = 'item'}, {target = 'silicon', type = 'item'}}, {localized_name = {'technology-name.repl-sapphire'}, internal_name = 'sapphire'})
      repltech_item_table({replsub_item('emerald-ore', {target = 'gem-ore', type = 'var', multiplier = 1 / bobmods.gems.EmeraldRatio}), replsub_recipe('bob-emerald-3'), replsub_recipe('bob-emerald-4')}, 'chemical', {{target = 'oxygen', type = 'item'}, {target = 'aluminium-plate', type = 'item'}, {target = 'silicon', type = 'item'}}, {localized_name = {'technology-name.repl-emerald'}, internal_name = 'emerald'})
      repltech_item_table({replsub_item('amethyst-ore', {target = 'gem-ore', type = 'var', multiplier = 1 / bobmods.gems.AmethystRatio}), replsub_recipe('bob-amethyst-3'), replsub_recipe('bob-amethyst-4')}, 'chemical', {{target = 'oxygen', type = 'item'}, {target = 'aluminium-plate', type = 'item'}, {target = 'silicon', type = 'item'}}, {localized_name = {'technology-name.repl-amethyst'}, internal_name = 'amethyst'})
      repltech_item_table({replsub_item('topaz-ore', {target = 'gem-ore', type = 'var', multiplier = 1 / bobmods.gems.TopazRatio}), replsub_recipe('bob-topaz-3'), replsub_recipe('bob-topaz-4')}, 'chemical', {{target = 'oxygen', type = 'item'}, {target = 'aluminium-plate', type = 'item'}, {target = 'silicon', type = 'item'}}, {localized_name = {'technology-name.repl-topaz'}, internal_name = 'topaz'})
      repltech_item_table({replsub_recipe('bob-diamond-5'), replsub_recipe('bob-ruby-5'), replsub_recipe('bob-sapphire-5'), replsub_recipe('bob-emerald-5'), replsub_recipe('bob-amethyst-5'), replsub_recipe('bob-topaz-5')}, 'chemical', {{target = 'ruby-4', type = 'item'}, {target = 'sapphire-4', type = 'item'}, {target = 'emerald-4', type = 'item'}, {target = 'amethyst-4', type = 'item'}, {target = 'topaz-4', type = 'item'}, {target = 'diamond-4', type = 'item'}, {target = 'polishing-compound', type = 'item'}}, {localized_name = {'technology-name.repl-shining'}, internal_name = 'shining-gems'})
    end

    --Alloys and their gears
    repladd_recipe('steel-plate', 'steel-gear-wheel')
    repltech_recipe('bronze-alloy', 'alloy')
    repltech_item_table({replsub_recipe('brass-alloy'), replsub_recipe('brass-gear-wheel')}, 'alloy', 'brass-alloy')
    repltech_recipe('electrum-alloy', 'alloy')
    repltech_recipe('copper-tungsten-alloy', 'alloy')
    repltech_recipe('tungsten-carbide', 'alloy')
    repltech_recipe('gunmetal-alloy', 'alloy')
    repltech_recipe('invar-alloy', 'alloy')
    repltech_item_table({replsub_recipe('nitinol-alloy'), replsub_recipe('nitinol-gear-wheel')}, 'alloy', 'nitinol-alloy')
    repltech_recipe('cobalt-steel-alloy', 'alloy')

    --Other
    repltech_recipe('bob-rubber', 'ore')
    repltech_recipe('insulated-cable', 'shape')
    repltech_recipe('silicon-nitride', 'chemical')
    repltech_recipe('advanced-processing-unit', 'device5')
    if settings.startup['bobmods-plates-purewater'].value then
      repltech_item('pure-water', 'chemical', 'pure-water', {{target = 'hydrogen', type = 'item'}, {target = 'oxygen', type = 'item'}})
    end
    replvar('steel-bearing-ball')
    replvar('titanium-bearing-ball')
    replvar('nitinol-bearing-ball')
    replvar('ceramic-bearing-ball')
    repltech_item_table({replsub_recipe('steel-bearing'), replsub_recipe('titanium-bearing'), replsub_recipe('nitinol-bearing'), replsub_recipe('ceramic-bearing')}, 'device3', {'steel-bearing', 'titanium-bearing', 'nitinol-bearing', 'ceramic-bearing'}, {localized_name = {'technology-name.repl-bearings'}, internal_name = 'bearings'})

    repltech_recipe('lithium-water-electrolysis', 'chemical')
    repltech_recipe('lithium-cobalt-oxide', 'chemical')
    repltech_recipe('lithium-ion-battery', 'device4')

    if data.raw.fluid.ammonia then
      repltech_recipe('ammonia', 'chemical')
      repltech_recipe('nitric-oxide', 'chemical')
      repltech_recipe('nitrogen-dioxide', 'chemical', {tier = 4})
      repltech_recipe('silver-nitrate', 'chemical', {tier = 4})
      repltech_recipe('silver-oxide', 'chemical', {tier = 5})
      repltech_recipe('silver-zinc-battery', 'device5')
    else
      repltech_recipe('nitrogen-dioxide', 'chemical')
      repltech_recipe('silver-nitrate', 'chemical')
      repltech_recipe('silver-oxide', 'chemical', {tier = 4})
      repltech_recipe('silver-zinc-battery', 'device4')
    end

    --Replace the sulfuric acid replication
    if data.raw.fluid['sulfur-dioxide'] then
      repl_table['sulfuric-acid'] = nil
      repltech_recipe('sulfur-dioxide', 'chemical')
      repltech_recipe('sulfuric-acid-2', 'chemical')
    end
  end
end

if bobmods.electronics then
  --Plate-specific ingredients
  if bobmods.plates then
    repltech_item_table({replsub_recipe('solder'), replsub_recipe('solder-alloy')}, 'alloy', {'solder', 'solder-alloy'})
    repltech_recipe('tinned-copper-cable', 'shape')
    repltech_recipe('gilded-copper-cable', 'shape')
    repltech_recipe('silicon-wafer', 'shape')
  else
    repltech_recipe('advanced-processing-unit', 'device5')
  end

  --Basic circuit board
  repladd_recipe('wood', 'wooden-board')
  repltech_recipe('basic-circuit-board', 'device2')

  --Basic electronic board
  repltech_ore('resin', 2)
  repltech_recipe('basic-electronic-components', 'device2')

  --Electronic circuit board
  repltech_recipe('ferric-chloride-solution', 'chemical')
  repltech_item_table({replsub_recipe('circuit-board'), replsub_recipe('phenolic-board')}, 'device3', {'circuit-board', 'phenolic-board'})
  repltech_recipe('electronic-components', 'device3')

  --Electronic logic board
  repltech_item_table({replsub_recipe('superior-circuit-board'), replsub_recipe('fibreglass-board')}, 'device3', {'superior-circuit-board', 'fibreglass-board'})
  repltech_recipe('intergrated-electronics', 'device4')

  --Electronic Processing board
  repltech_recipe('multi-layer-circuit-board', 'device4')
  repltech_recipe('processing-electronics', 'device5')
end

if bobmods.modules then
  --Generate module components
  repltech_recipe('module-case', 'module', {tier = 3})
  repltech_recipe('module-contact', 'module', {tier = 2})
  repltech_recipe('module-circuit-board', 'module', {tier = 3})
  repltech_recipe('module-processor-board', 'module', {tier = 3, internal_name = 'module-processor-board-a'})
  repltech_recipe('module-processor-board-2', 'module', {tier = 4, internal_name = 'module-processor-board-b'})
  repltech_recipe('module-processor-board-3', 'module', {tier = 4, internal_name = 'module-processor-board-c'})

  --Module processors
  repltech_recipe('speed-processor', 'module', {tier = 4, internal_name = 'speed-processor-a'})
  repltech_recipe('speed-processor-2', 'module', {tier = 4, internal_name = 'speed-processor-b'})
  repltech_recipe('speed-processor-3', 'module', {tier = 5, internal_name = 'speed-processor-c'})
  repltech_recipe('effectivity-processor', 'module', {tier = 4, internal_name = 'effectivity-processor-a'})
  repltech_recipe('effectivity-processor-2', 'module', {tier = 4, internal_name = 'effectivity-processor-b'})
  repltech_recipe('effectivity-processor-3', 'module', {tier = 5, internal_name = 'effectivity-processor-c'})
  repltech_recipe('productivity-processor', 'module', {tier = 4, internal_name = 'productivity-processor-a'})
  repltech_recipe('productivity-processor-2', 'module', {tier = 4, internal_name = 'productivity-processor-b'})
  repltech_recipe('productivity-processor-3', 'module', {tier = 5, internal_name = 'productivity-processor-c'})
  repltech_recipe('pollution-clean-processor', 'module', {tier = 4, internal_name = 'pollution-clean-processor-a'})
  repltech_recipe('pollution-clean-processor-2', 'module', {tier = 4, internal_name = 'pollution-clean-processor-b'})
  repltech_recipe('pollution-clean-processor-3', 'module', {tier = 5, internal_name = 'pollution-clean-processor-c'})
  repltech_recipe('pollution-create-processor', 'module', {tier = 4, internal_name = 'pollution-create-processor-a'})
  repltech_recipe('pollution-create-processor-2', 'module', {tier = 4, internal_name = 'pollution-create-processor-b'})
  repltech_recipe('pollution-create-processor-3', 'module', {tier = 5, internal_name = 'pollution-create-processor-c'})

  --Modules
  repltech_recipe('speed-module-4', 'module')
  repltech_recipe('speed-module-5', 'module')
  repltech_recipe('speed-module-6', 'module')
  repltech_recipe('speed-module-7', 'module')
  repltech_recipe('speed-module-8', 'module')

  repltech_recipe('effectivity-module-4', 'module')
  repltech_recipe('effectivity-module-5', 'module')
  repltech_recipe('effectivity-module-6', 'module')
  repltech_recipe('effectivity-module-7', 'module')
  repltech_recipe('effectivity-module-8', 'module')

  repltech_recipe('productivity-module-4', 'module')
  repltech_recipe('productivity-module-5', 'module')
  repltech_recipe('productivity-module-6', 'module')
  repltech_recipe('productivity-module-7', 'module')
  repltech_recipe('productivity-module-8', 'module')

  repltech_recipe('pollution-clean-module-1', 'module', {tier = 4})
  repltech_recipe('pollution-clean-module-2', 'module')
  repltech_recipe('pollution-clean-module-3', 'module')
  repltech_recipe('pollution-clean-module-4', 'module')
  repltech_recipe('pollution-clean-module-5', 'module')
  repltech_recipe('pollution-clean-module-6', 'module')
  repltech_recipe('pollution-clean-module-7', 'module')
  repltech_recipe('pollution-clean-module-8', 'module')

  repltech_recipe('pollution-create-module-1', 'module', {tier = 4})
  repltech_recipe('pollution-create-module-2', 'module')
  repltech_recipe('pollution-create-module-3', 'module')
  repltech_recipe('pollution-create-module-4', 'module')
  repltech_recipe('pollution-create-module-5', 'module')
  repltech_recipe('pollution-create-module-6', 'module')
  repltech_recipe('pollution-create-module-7', 'module')
  repltech_recipe('pollution-create-module-8', 'module')

  if settings.startup['bobmods-modules-enablerawspeedmodules'].value then
    repltech_recipe('raw-speed-module-1', 'module', {tier = 4})
    repltech_recipe('raw-speed-module-2', 'module')
    repltech_recipe('raw-speed-module-3', 'module')
    repltech_recipe('raw-speed-module-4', 'module')
    repltech_recipe('raw-speed-module-5', 'module')
    repltech_recipe('raw-speed-module-6', 'module')
    repltech_recipe('raw-speed-module-7', 'module')
    repltech_recipe('raw-speed-module-8', 'module')
  end
  if settings.startup['bobmods-modules-enablegreenmodules'].value then
    repltech_recipe('green-module-1', 'module', {tier = 4})
    repltech_recipe('green-module-2', 'module')
    repltech_recipe('green-module-3', 'module')
    repltech_recipe('green-module-4', 'module')
    repltech_recipe('green-module-5', 'module')
    repltech_recipe('green-module-6', 'module')
    repltech_recipe('green-module-7', 'module')
    repltech_recipe('green-module-8', 'module')
  end
  if settings.startup['bobmods-modules-enablerawproductivitymodules'].value then
    repltech_recipe('raw-productivity-module-1', 'module', {tier = 4})
    repltech_recipe('raw-productivity-module-2', 'module')
    repltech_recipe('raw-productivity-module-3', 'module')
    repltech_recipe('raw-productivity-module-4', 'module')
    repltech_recipe('raw-productivity-module-5', 'module')
    repltech_recipe('raw-productivity-module-6', 'module')
    repltech_recipe('raw-productivity-module-7', 'module')
    repltech_recipe('raw-productivity-module-8', 'module')
  end
  if settings.startup['bobmods-modules-enablegodmodules'].value then
    repltech_recipe('god-module-1', 'module', {tier = 4})
    repltech_recipe('god-module-2', 'module')
    repltech_recipe('god-module-3', 'module')
    repltech_recipe('god-module-4', 'module')
    repltech_recipe('god-module-5', 'module')
  end
end

if bobmods.logistics then
  --Add numbers to the replications of vanilla robotics stuff
  local placeholder

  placeholder = repl_table['flying-robot-frame']
  placeholder.name = 'flying-robot-frame-1'
  placeholder.overrides.local_name = 'flying-robot-frame-1'
  placeholder.overrides.upgrade = true
  repl_table['flying-robot-frame-1'] = placeholder
  repl_table['flying-robot-frame'] = nil

  placeholder = repl_table['construction-robot']
  placeholder.name = 'construction-robot-1'
  placeholder.overrides.local_name = 'construction-robot-1'
  placeholder.overrides.upgrade = true
  repl_table['construction-robot-1'] = placeholder
  repl_table['construction-robot'] = nil

  placeholder = repl_table['logistic-robot']
  placeholder.name = 'logistic-robot-1'
  placeholder.overrides.local_name = 'logistic-robot-1'
  placeholder.overrides.upgrade = true
  repl_table['logistic-robot-1'] = placeholder
  repl_table['logistic-robot'] = nil

  placeholder = repl_table['roboport']
  placeholder.name = 'bob-roboport-1'
  placeholder.overrides.local_name = 'bob-roboport-1'
  placeholder.overrides.upgrade = true
  repl_table['bob-roboport-1'] = placeholder
  repl_table['roboport'] = nil
  replmod_category('bob-roboport-1', 'device5')

  --Flying robot frames
  repltech_recipe('flying-robot-frame-2', 'device4', {upgrade = true})
  repltech_recipe('flying-robot-frame-3', 'device5', {upgrade = true})
  repltech_recipe('flying-robot-frame-4', 'device5', {upgrade = true})

  if bobmods.warfare and bobmods.warfare.RobotParts then
    --Robot brains
    repltech_item_table({replsub_recipe('robot-brain-logistic'), replsub_recipe('robot-brain-construction')}, 'device4', 'robot-brain-logistic', {internal_name = 'robot-brain-1', localized_name = {'technology-name.repl-robot-brain-1'}, upgrade = true})
    repltech_item_table({replsub_recipe('robot-brain-logistic-2'), replsub_recipe('robot-brain-construction-2')}, 'device4', 'robot-brain-logistic-2', {internal_name = 'robot-brain-2', localized_name = {'technology-name.repl-robot-brain-2'}, upgrade = true})
    repltech_item_table({replsub_recipe('robot-brain-logistic-3'), replsub_recipe('robot-brain-construction-3')}, 'device4', 'robot-brain-logistic-3', {internal_name = 'robot-brain-3', localized_name = {'technology-name.repl-robot-brain-3'}, upgrade = true})
    repltech_item_table({replsub_recipe('robot-brain-logistic-4'), replsub_recipe('robot-brain-construction-4')}, 'device5', 'robot-brain-logistic-4', {internal_name = 'robot-brain-4', localized_name = {'technology-name.repl-robot-brain-4'}, upgrade = true})

    --Robot tools
    repltech_item_table({replsub_recipe('robot-tool-logistic'), replsub_recipe('robot-tool-construction')}, 'device4', 'robot-tool-logistic', {internal_name = 'robot-tool-1', localized_name = {'technology-name.repl-robot-tool-1'}, upgrade = true})
    repltech_item_table({replsub_recipe('robot-tool-logistic-2'), replsub_recipe('robot-tool-construction-2')}, 'device4', 'robot-tool-logistic-2', {internal_name = 'robot-tool-2', localized_name = {'technology-name.repl-robot-tool-2'}, upgrade = true})
    repltech_item_table({replsub_recipe('robot-tool-logistic-3'), replsub_recipe('robot-tool-construction-3')}, 'device4', 'robot-tool-logistic-3', {internal_name = 'robot-tool-3', localized_name = {'technology-name.repl-robot-tool-3'}, upgrade = true})
    repltech_item_table({replsub_recipe('robot-tool-logistic-4'), replsub_recipe('robot-tool-construction-4')}, 'device5', 'robot-tool-logistic-4', {internal_name = 'robot-tool-4', localized_name = {'technology-name.repl-robot-tool-4'}, upgrade = true})
  end

  --Robots
  repltech_recipe('bob-logistic-robot-2', 'device5')
  repltech_recipe('bob-logistic-robot-3', 'device5')
  repltech_recipe('bob-logistic-robot-4', 'device5')
  repltech_recipe('bob-construction-robot-2', 'device5')
  repltech_recipe('bob-construction-robot-3', 'device5')
  repltech_recipe('bob-construction-robot-4', 'device5')

  --Roboports
  repltech_recipe('roboport-antenna-1', 'device4', {upgrade = true})
  repltech_recipe('roboport-chargepad-1', 'device4', {upgrade = true})
  repltech_recipe('roboport-door-1', 'device4', {upgrade = true})
  repltech_recipe('roboport-antenna-2', 'device4', {upgrade = true})
  repltech_recipe('roboport-chargepad-2', 'device4', {upgrade = true})
  repltech_recipe('roboport-door-2', 'device4', {upgrade = true})
  repltech_recipe('bob-roboport-2', 'device5', {upgrade = true})
  repltech_recipe('roboport-antenna-3', 'device5', {upgrade = true})
  repltech_recipe('roboport-chargepad-3', 'device5', {upgrade = true})
  repltech_recipe('roboport-door-3', 'device5', {upgrade = true})
  repltech_recipe('bob-roboport-3', 'device5', {upgrade = true})
  repltech_recipe('roboport-antenna-4', 'device5', {upgrade = true})
  repltech_recipe('roboport-chargepad-4', 'device5', {upgrade = true})
  repltech_recipe('roboport-door-4', 'device5', {upgrade = true})
  repltech_recipe('bob-roboport-4', 'device5', {upgrade = true})
end

--Add warfare stuff
if bobmods.warfare then
  --Combat robotics
  repladd_recipe('defender-capsule', 'defender-robot')
  repl_table['defender-capsule'].prerequisites = replsub_prereq('defender-robot')
  replmod_category('defender-capsule', 'device4')

  repladd_recipe('distractor-capsule', 'distractor-robot')
  repl_table['distractor-capsule'].prerequisites = replsub_prereq('distractor-robot')
  replmod_category('distractor-capsule', 'device5')

  repladd_recipe('destroyer-capsule', 'destroyer-robot')
  repl_table['destroyer-capsule'].prerequisites = replsub_prereq('destroyer-robot')

  repltech_recipe('bob-laser-robot-capsule', 'device5')
  repladd_recipe('bob-laser-robot-capsule', 'bob-laser-robot')

  repltech_recipe('bob-robot-tank', 'device5')

  --If Bob Logistics is enabled, add the combat robot parts to the repltechs for the similar robot parts.  If it isn't enabled, create new repltechs for these robot parts.
  if bobmods.warfare.RobotParts then
    if bobmods.logistics then
      repladd_recipe('robot-brain-1', 'robot-brain-combat')
      repladd_recipe('robot-brain-2', 'robot-brain-combat-2')
      repladd_recipe('robot-brain-3', 'robot-brain-combat-3')
      repladd_recipe('robot-tool-1', 'robot-tool-combat')
      repladd_recipe('robot-tool-2', 'robot-tool-combat-2')
      repladd_recipe('robot-tool-3', 'robot-tool-combat-3')
    else
      repltech_recipe('robot-brain-combat', 'device4', {internal_name = 'robot-brain-1', localized_name = {'technology-name.repl-robot-brain-1'}, upgrade = true})
      repltech_recipe('robot-brain-combat-2', 'device4', {internal_name = 'robot-brain-2', localized_name = {'technology-name.repl-robot-brain-2'}, upgrade = true})
      repltech_recipe('robot-brain-combat-3', 'device4', {internal_name = 'robot-brain-3', localized_name = {'technology-name.repl-robot-brain-3'}, upgrade = true})
      repltech_recipe('robot-tool-combat', 'device4', {internal_name = 'robot-tool-1', localized_name = {'technology-name.repl-robot-tool-1'}, upgrade = true})
      repltech_recipe('robot-tool-combat-2', 'device4', {internal_name = 'robot-tool-2', localized_name = {'technology-name.repl-robot-tool-2'}, upgrade = true})
      repltech_recipe('robot-tool-combat-3', 'device4', {internal_name = 'robot-tool-3', localized_name = {'technology-name.repl-robot-tool-3'}, upgrade = true})
    end
    repltech_recipe('robot-brain-combat-4', 'device5')
    repltech_recipe('robot-tool-combat-4', 'device5')
  end

  --Ammunition
  repltech_recipe('glycerol', 'chemical')
  repltech_recipe('sulfuric-nitric-acid', 'chemical')
  repltech_recipe('nitroglycerin', 'chemical')

  repltech_recipe('nitric-acid', 'chemical')
  repltech_recipe('gun-cotton', 'chemical')

  repltech_recipe('petroleum-jelly', 'chemical')
  repltech_recipe('cordite', 'chemical')

  repltech_recipe('magazine', 'alloy')
  repltech_recipe('bullet-casing', 'alloy')
  repltech_recipe('shotgun-shell-casing', 'alloy')
  repltech_recipe('laser-rifle-battery-case', 'chemical')
  repltech_recipe('rocket-engine', 'shape')
  repltech_recipe('liquid-fuel', 'chemical')
  repltech_recipe('rocket-body', 'device5')

  repltech_recipe('bullet-projectile', 'device2')
  repltech_recipe('bullet', 'device3')
  repltech_recipe('bullet-magazine', 'device4')
  repltech_recipe('ap-bullet-projectile', 'device2')
  repltech_recipe('ap-bullet', 'device3')
  repltech_recipe('ap-bullet-magazine', 'device4')
  repltech_recipe('he-bullet-projectile', 'device2')
  repltech_recipe('he-bullet', 'device3')
  repltech_recipe('he-bullet-magazine', 'device4')
  repltech_recipe('flame-bullet-projectile', 'device2')
  repltech_recipe('flame-bullet', 'device3')
  repltech_recipe('flame-bullet-magazine', 'device4')
  repltech_recipe('acid-bullet-projectile', 'device2')
  repltech_recipe('acid-bullet', 'device3')
  repltech_recipe('acid-bullet-magazine', 'device4')
  repltech_recipe('poison-bullet-projectile', 'device2')
  repltech_recipe('poison-bullet', 'device3')
  repltech_recipe('poison-bullet-magazine', 'device4')
  repltech_recipe('electric-bullet-projectile', 'device2')
  repltech_recipe('electric-bullet', 'device3')
  repltech_recipe('electric-bullet-magazine', 'device4')
  repltech_recipe('uranium-bullet-projectile', 'device2')
  repltech_recipe('uranium-bullet', 'device3')

  repltech_recipe('shot', 'shape')
  repltech_recipe('better-shotgun-shell', 'device3')
  repltech_recipe('shotgun-ap-shell', 'device3')
  repltech_recipe('shotgun-electric-shell', 'device3')
  repltech_recipe('shotgun-explosive-shell', 'device3')
  repltech_recipe('shotgun-flame-shell', 'device3')
  repltech_recipe('shotgun-acid-shell', 'device3')
  repltech_recipe('shotgun-poison-shell', 'device3')

  repltech_recipe('laser-rifle-battery', 'device3')
  repltech_recipe('laser-rifle-battery-sapphire', 'device3')
  repltech_recipe('laser-rifle-battery-amethyst', 'device4')
  repltech_recipe('laser-rifle-battery-diamond', 'device5')

  repltech_recipe('rocket-warhead', 'device3')
  repltech_recipe('bob-rocket', 'device5')
  repltech_recipe('piercing-rocket-warhead', 'device3')
  repltech_recipe('bob-piercing-rocket', 'device5')
  repltech_recipe('electric-rocket-warhead', 'device3')
  repltech_recipe('bob-electric-rocket', 'device5')
  repltech_recipe('explosive-rocket-warhead', 'device3')
  repltech_recipe('bob-explosive-rocket', 'device5')
  repltech_recipe('acid-rocket-warhead', 'device3')
  repltech_recipe('bob-acid-rocket', 'device5')
  repltech_recipe('flame-rocket-warhead', 'device3')
  repltech_recipe('bob-flame-rocket', 'device5')
  repltech_recipe('poison-rocket-warhead', 'device3')
  repltech_recipe('bob-poison-rocket', 'device5')

  repltech_recipe('scatter-cannon-shell', 'device3')

  repltech_recipe('poison-artillery-shell', 'device3')
  repltech_recipe('explosive-artillery-shell', 'device3')
  repltech_recipe('distractor-artillery-shell', 'device5')

  repltech_recipe('poison-mine', 'device4')
  repltech_recipe('slowdown-mine', 'device4')
  repltech_recipe('distractor-mine', 'device5')

  repltech_recipe('bob-gun-turret-2', 'device4')
  repltech_recipe('bob-gun-turret-3', 'device4')
  repltech_recipe('bob-gun-turret-4', 'device5')
  repltech_recipe('bob-gun-turret-5', 'device5')
  repltech_recipe('bob-sniper-turret-1', 'device3')
  repltech_recipe('bob-sniper-turret-2', 'device4')
  repltech_recipe('bob-sniper-turret-3', 'device4')
  replmod_category('laser-turret', 'device3') --Basic laser turrets use simpler electronics under Bob Warfare
  repltech_recipe('bob-laser-turret-2', 'device4')
  repltech_recipe('bob-laser-turret-3', 'device4')
  repltech_recipe('bob-laser-turret-4', 'device5')
  repltech_recipe('bob-laser-turret-5', 'device5')
end

if data.raw.item['heat-shield-tile'] then
  repltech_recipe('heat-shield-tile', 'device3')
end

if data.raw.item['solar-panel-3'] then
  repltech_recipe('solar-panel-2', 'device4')
  repltech_recipe('solar-panel-3', 'device5')
end
if data.raw.item['radar-5'] then
  repltech_recipe('radar-2', 'device3')
  repltech_recipe('radar-3', 'device4')
  repltech_recipe('radar-4', 'device5')
  repltech_recipe('radar-5', 'device5')
end
