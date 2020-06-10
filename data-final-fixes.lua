if mods["bobelectronics"] then
if data.raw.recipe["replication-lab"] then

			data.raw.recipe["replication-lab"].ingredients = {
            {"dark-matter-scoop", 5},
            {"basic-circuit-board", 10}, -- this being the only thing that changed
            {"copper-plate", 10},
			{"iron-plate", 10}
        }
		
if data.raw.recipe["replicator-1"] then
			data.raw.recipe["replicator-1"].ingredients = {
            {"dark-matter-scoop", 15},
            {"basic-circuit-board", 10},
            {"copper-plate", 10},
			{"iron-plate", 10}
        }
if data.raw.recipe["replicator-2"] then
			data.raw.recipe["replicator-2"].ingredients = {
            {"dark-matter-scoop", 5},
            {"basic-circuit-board", 10},
            {"copper-plate", 10},
			{"iron-plate", 10}
        }
if data.raw.recipe["replicator-3"] then
			data.raw.recipe["replicator-3"].ingredients = {
			{"dark-matter-transducer", 4},
            {"basic-circuit-board", 10},
            {"copper-plate", 10},
			{"iron-plate", 10}
			
        }
end
end
end
end
end