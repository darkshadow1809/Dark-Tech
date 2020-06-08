local base_power = 60
local factor = 3.5

data:extend(
  {
    {
      type = 'item',
      name = 'solar-panel-MK1',
      icon = '__dark-tech__/graphics/icons/solar/solar-panel.png',
      icon_size = 32,
      flags = {},
      subgroup = 'clean-power',
      order = 'd[solar-panel]-a[solar-panel]',
      place_result = 'solar-panel-MK1',
      stack_size = 50
    },
    {
      type = 'item',
      name = 'solar-panel-MK2',
      icon = '__dark-tech__/graphics/icons/solar/solar-panel-MK2.png',
      icon_size = 32,
      flags = {},
      subgroup = 'clean-power',
      order = 'd[solar-panel]-a[solar-panel]',
      place_result = 'solar-panel-MK2',
      stack_size = 50
    },
    {
      type = 'item',
      name = 'solar-panel-MK3',
      icon = '__dark-tech__/graphics/icons/solar/solar-panel-MK3.png',
      icon_size = 32,
      flags = {},
      subgroup = 'clean-power',
      order = 'd[solar-panel]-a[solar-panel]',
      place_result = 'solar-panel-MK3',
      stack_size = 50
    },
    {
      type = 'item',
      name = 'solar-panel-MK4',
      icon = '__dark-tech__/graphics/icons/solar/solar-panel-MK4.png',
      icon_size = 32,
      flags = {},
      subgroup = 'clean-power',
      order = 'd[solar-panel]-a[solar-panel]',
      place_result = 'solar-panel-MK4',
      stack_size = 50
    },
    {
      type = 'item',
      name = 'solar-panel-MK5',
      icon = '__dark-tech__/graphics/icons/solar/solar-panel-MK5.png',
      icon_size = 32,
      flags = {},
      subgroup = 'clean-power',
      order = 'd[solar-panel]-a[solar-panel]',
      place_result = 'solar-panel-MK5',
      stack_size = 50
    }
  }
)

data:extend(
  {
    {
      type = 'recipe',
      name = 'solar-panel-MK1',
      category = 'crafting',
      enabled = 'true',
      energy_required = 0.5,
      ingredients = {
        {'dark-matter-scoop', 1},
        {'matter-plate', 2},
        {'copper-plate', 5}
      },
      result = 'solar-panel-MK1'
    },
    {
      type = 'recipe',
      name = 'solar-panel-MK2',
      category = 'crafting',
      enabled = 'false',
      energy_required = 0.5,
      ingredients = {
        {'solar-panel-MK1', 1},
        {'dark-matter-scoop', 8},
        {'matter-plate', 1}
      },
      result = 'solar-panel-MK2'
    },
    {
      type = 'recipe',
      name = 'solar-panel-MK3',
      category = 'crafting',
      enabled = 'false',
      energy_required = 0.5,
      ingredients = {
        {'matter-plate', 2},
        {'advanced-circuit', 2},
        {'solar-panel-MK2', 1},
        {'steel-plate', 3}
      },
      result = 'solar-panel-MK3'
    },
    {
      type = 'recipe',
      name = 'solar-panel-MK4',
      category = 'crafting',
      enabled = 'false',
      energy_required = 0.5,
      ingredients = {
        {'matter-plate', 1},
        {'advanced-circuit', 5},
        {'solar-panel-MK3', 1},
        {'steel-plate', 6}
      },
      result = 'solar-panel-MK4'
    },
    {
      type = 'recipe',
      name = 'solar-panel-MK5',
      category = 'crafting',
      enabled = 'false',
      energy_required = 0.5,
      ingredients = {
        {'matter-plate', 2},
        {'processing-unit', 2},
        {'solar-panel-MK4', 1},
        {'steel-plate', 12}
      },
      result = 'solar-panel-MK5'
    }
  }
)

data:extend(
  {
    {
      type = 'solar-panel',
      name = 'solar-panel-MK1',
      fast_replaceable_group = 'solar-panel',
      icon = '__dark-tech__/graphics/icons/solar/solar-panel.png',
      icon_size = 32,
      flags = {'placeable-neutral', 'player-creation'},
      minable = {hardness = 0.2, mining_time = 0.5, result = 'solar-panel-MK1'},
      max_health = 200,
      corpse = 'big-remnants',
      collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
      selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
      energy_source = {
        type = 'electric',
        usage_priority = 'solar'
      },
      picture = {
        filename = '__dark-tech__/graphics/entity/solar/solar-panel.png',
        priority = 'high',
        width = 104,
        height = 96,
        scale = 0.67
      },
      production = base_power * factor ^ 0 .. 'kW'
    },
    {
      type = 'solar-panel',
      name = 'solar-panel-MK2',
      fast_replaceable_group = 'solar-panel',
      icon = '__dark-tech__/graphics/icons/solar/solar-panel-MK2.png',
      icon_size = 32,
      flags = {'placeable-neutral', 'player-creation'},
      minable = {hardness = 0.2, mining_time = 0.5, result = 'solar-panel-MK2'},
      max_health = 200,
      corpse = 'big-remnants',
      collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
      selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
      energy_source = {
        type = 'electric',
        usage_priority = 'solar'
      },
      picture = {
        filename = '__dark-tech__/graphics/entity/solar/solar-panel-MK2.png',
        priority = 'high',
        width = 104,
        height = 96,
        scale = 0.67
      },
      production = base_power * factor ^ 1 .. 'kW'
    },
    {
      type = 'solar-panel',
      name = 'solar-panel-MK3',
      fast_replaceable_group = 'solar-panel',
      icon = '__dark-tech__/graphics/icons/solar/solar-panel-MK3.png',
      icon_size = 32,
      flags = {'placeable-neutral', 'player-creation'},
      minable = {hardness = 0.2, mining_time = 0.5, result = 'solar-panel-MK3'},
      max_health = 300,
      corpse = 'big-remnants',
      collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
      selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
      energy_source = {
        type = 'electric',
        usage_priority = 'solar'
      },
      picture = {
        filename = '__dark-tech__/graphics/entity/solar/solar-panel-MK3.png',
        priority = 'high',
        width = 104,
        height = 96,
        scale = 0.67
      },
      production = base_power * factor ^ 2 .. 'kW'
    },
    {
      type = 'solar-panel',
      name = 'solar-panel-MK4',
      fast_replaceable_group = 'solar-panel',
      icon = '__dark-tech__/graphics/icons/solar/solar-panel-MK4.png',
      icon_size = 32,
      flags = {'placeable-neutral', 'player-creation'},
      minable = {hardness = 0.2, mining_time = 0.5, result = 'solar-panel-MK4'},
      max_health = 400,
      corpse = 'big-remnants',
      collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
      selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
      energy_source = {
        type = 'electric',
        usage_priority = 'solar'
      },
      picture = {
        filename = '__dark-tech__/graphics/entity/solar/solar-panel-MK4.png',
        icon_size = 32,
        priority = 'high',
        width = 104,
        height = 96,
        scale = 0.67
      },
      production = base_power * factor ^ 3 .. 'kW'
    },
    {
      type = 'solar-panel',
      name = 'solar-panel-MK5',
      fast_replaceable_group = 'solar-panel',
      icon = '__dark-tech__/graphics/icons/solar/solar-panel-MK5.png',
      icon_size = 32,
      flags = {'placeable-neutral', 'player-creation'},
      minable = {hardness = 0.2, mining_time = 0.5, result = 'solar-panel-MK5'},
      max_health = 500,
      corpse = 'big-remnants',
      collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
      selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
      energy_source = {
        type = 'electric',
        usage_priority = 'solar'
      },
      picture = {
        filename = '__dark-tech__/graphics/entity/solar/solar-panel-MK5.png',
        priority = 'high',
        width = 104,
        height = 96,
        scale = 0.67
      },
      production = base_power * factor ^ 4 .. 'kW'
    }
  }
)
