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
      if data.raw.recipe['replicator-2'] then
        data.raw.recipe['replicator-2'].ingredients = {
          {'dark-matter-scoop', 5},
          {'basic-circuit-board', 10},
          {'copper-plate', 10},
          {'iron-plate', 10}
        }
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
  end
end
--Go through the tables of replications and calculate the numerical costs of all item replications
require('prototypes.repltable.process-costs')
--Go through the tables of replication technologies and sort out their prerequisite technologies
require('prototypes.repltable.process-prereqs')
--Parse the replication table and make the replications and their unlock technologies via the table's data
require('prototypes.repltable.process-actual-creation')
