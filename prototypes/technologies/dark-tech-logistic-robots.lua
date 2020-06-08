data:extend(
  {
    {
      type = 'technology',
      name = 'dark-tech-construction-robotics',
      icon = '__base__/graphics/technology/construction-robotics.png',
      icon_size = 128,
      effects = {
        {
          type = 'unlock-recipe',
          recipe = 'dark-tech-roboport'
        },
        {
          type = 'unlock-recipe',
          recipe = 'dark-tech-logistic-chest-passive-provider'
        },
        {
          type = 'unlock-recipe',
          recipe = 'dark-tech-logistic-chest-storage'
        },
        {
          type = 'unlock-recipe',
          recipe = 'dark-tech-construction-robot'
        },
        {
          type = 'ghost-time-to-live',
          modifier = 60 * 60 * 5
        }
      },
      prerequisites = {},
      unit = repl_research(1, 10, 3, 50),
      order = 'c-k-a'
    },
    {
      type = 'technology',
      name = 'dark-tech-logistic-robotics',
      icon = '__base__/graphics/technology/logistic-robotics.png',
      icon_size = 128,
      effects = {
        {
          type = 'unlock-recipe',
          recipe = 'dark-tech-roboport'
        },
        {
          type = 'unlock-recipe',
          recipe = 'dark-tech-logistic-chest-passive-provider'
        },
        {
          type = 'unlock-recipe',
          recipe = 'dark-tech-logistic-robot'
        }
      },
      prerequisites = {},
      unit = repl_research(1, 10, 3, 50),
      order = 'c-k-a'
    },
    {
      type = 'technology',
      name = 'dark-tech-logistic-system',
      icon = '__base__/graphics/technology/logistic-system.png',
      icon_size = 128,
      effects = {
        {
          type = 'unlock-recipe',
          recipe = 'dark-tech-logistic-chest-active-provider'
        },
        {
          type = 'unlock-recipe',
          recipe = 'dark-tech-logistic-chest-requester'
        }
      },
      prerequisites = {},
      unit = repl_research(1, 10, 3, 50),
      order = 'c-k-a'
    }
  }
)
