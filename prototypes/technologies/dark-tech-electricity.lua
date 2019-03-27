data:extend(
 --[[
  {
    type = 'technology',
    name='clean-power-MK1',
    icon = '__dark-tech__/graphics/technology/electricity.png',
	icon_size = 32,
	effects =
    {
      {
        type = "unlock-recipe",
        recipe = "solar-panel-MK1"
      },
     {
        type = "unlock-recipe",
        recipe = "accumulator-MK1"
      }
    },
    prerequisites = {},
    unit = repl_research(1, 2, 30, 50), --tier, multiplier, time, reps_override
    order='a-f-a',
  },
  ]]--
  {
    {
    type = 'technology',
    name='clean-power-MK2',
    icon = '__dark-tech__/graphics/technology/electricity2.png',
	icon_size = 128,
	effects =
    {
      {
        type = "unlock-recipe",
        recipe = "solar-panel-MK2"
      },
     {
        type = "unlock-recipe",
        recipe = "accumulator-MK2"
      }
    },
    prerequisites = {},
    unit = repl_research(1, 1, 30, 50),
    order='a-f-a',
  },
      {
    type = 'technology',
    name='clean-power-MK3',
    icon = '__dark-tech__/graphics/technology/electricity3.png',
	icon_size = 128,
	effects =
    {
      {
        type = "unlock-recipe",
        recipe = "solar-panel-MK3"
      },
     {
        type = "unlock-recipe",
        recipe = "accumulator-MK3"
      }
    },
    prerequisites = {'clean-power-MK2'},
    unit = repl_research(2, 2, 30, 50),
    order='a-f-a',
  },
     {
    type = 'technology',
    name='clean-power-MK4',
    icon = '__dark-tech__/graphics/technology/electricity4.png',
	icon_size = 128,
	effects =
    {
      {
        type = "unlock-recipe",
        recipe = "solar-panel-MK4"
      },
     {
        type = "unlock-recipe",
        recipe = "accumulator-MK4"
      }
    },
    prerequisites = {'clean-power-MK3'},
    unit = repl_research(3, 5, 30, 50),
    order='a-f-a',
  },
       {
    type = 'technology',
    name='clean-power-MK5',
    icon = '__dark-tech__/graphics/technology/electricity5.png',
	icon_size = 128,
	effects =
    {
      {
        type = "unlock-recipe",
        recipe = "solar-panel-MK5"
      },
     {
        type = "unlock-recipe",
        recipe = "accumulator-MK5"
      }
    },
    prerequisites = {'clean-power-MK4'},
    unit = repl_research(3, 10, 30, 50),
    order='a-f-a',
  },
  })