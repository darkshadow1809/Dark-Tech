data:extend(
  {
    {
      type = 'item',
      name = 'accumulator-MK1',
      icon = '__dark-tech__/graphics/icons/accumulator/basic-accumulator.png',
      icon_size = 32,
      flags = {},
      subgroup = 'clean-power',
      order = 'e[accumulator]-a[basic-accumulator]',
      place_result = 'accumulator-MK1',
      stack_size = 50
    },
    {
      type = 'item',
      name = 'accumulator-MK2',
      icon = '__dark-tech__/graphics/icons/accumulator/accumulator-MK2.png',
      icon_size = 32,
      flags = {},
      subgroup = 'clean-power',
      order = 'e[accumulator]-a[basic-accumulator]',
      place_result = 'accumulator-MK2',
      stack_size = 50
    },
    {
      type = 'item',
      name = 'accumulator-MK3',
      icon = '__dark-tech__/graphics/icons/accumulator/accumulator-MK3.png',
      icon_size = 32,
      flags = {},
      subgroup = 'clean-power',
      order = 'e[accumulator]-a[basic-accumulator]',
      place_result = 'accumulator-MK3',
      stack_size = 50
    },
    {
      type = 'item',
      name = 'accumulator-MK4',
      icon = '__dark-tech__/graphics/icons/accumulator/accumulator-MK4.png',
      icon_size = 32,
      flags = {},
      subgroup = 'clean-power',
      order = 'e[accumulator]-a[basic-accumulator]',
      place_result = 'accumulator-MK4',
      stack_size = 50
    },
    {
      type = 'item',
      name = 'accumulator-MK5',
      icon = '__dark-tech__/graphics/icons/accumulator/accumulator-MK5.png',
      icon_size = 32,
      flags = {},
      subgroup = 'clean-power',
      order = 'e[accumulator]-a[basic-accumulator]',
      place_result = 'accumulator-MK5',
      stack_size = 50
    }
  }
)

data:extend(
  {
    {
      type = 'recipe',
      name = 'accumulator-MK1',
      enabled = 'true',
      ingredients = {
        {'dark-matter-scoop', 2},
        {'matter-plate', 1},
        {'copper-plate', 2}
      },
      result = 'accumulator-MK1'
    },
    {
      type = 'recipe',
      name = 'accumulator-MK2',
      enabled = 'false',
      ingredients = {
        {'accumulator-MK1', 1},
        {'dark-matter-scoop', 8},
        {'matter-plate', 1}
      },
      result = 'accumulator-MK2'
    },
    {
      type = 'recipe',
      name = 'accumulator-MK3',
      enabled = 'false',
      ingredients = {
        {'accumulator-MK2', 1},
        {'advanced-circuit', 2},
        {'matter-plate', 2}
      },
      result = 'accumulator-MK3'
    },
    {
      type = 'recipe',
      name = 'accumulator-MK4',
      enabled = 'false',
      ingredients = {
        {'accumulator-MK3', 1},
        {'advanced-circuit', 5},
        {'matter-plate', 1}
      },
      result = 'accumulator-MK4'
    },
    {
      type = 'recipe',
      name = 'accumulator-MK5',
      enabled = 'false',
      ingredients = {
        {'accumulator-MK4', 1},
        {'processing-unit', 2},
        {'matter-plate', 2}
      },
      result = 'accumulator-MK5'
    }
  }
)

data:extend(
  {
    {
      type = 'accumulator',
      name = 'accumulator-MK1',
      fast_replaceable_group = 'accumulator',
      icon = '__dark-tech__/graphics/icons/accumulator/basic-accumulator.png',
      icon_size = 32,
      flags = {'placeable-neutral', 'player-creation'},
      minable = {hardness = 0.2, mining_time = 0.5, result = 'accumulator-MK1'},
      max_health = 300,
      corpse = 'medium-remnants',
      collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
      selection_box = {{-1, -1}, {1, 1}},
      energy_source = {
        type = 'electric',
        buffer_capacity = '10MJ',
        usage_priority = 'tertiary',
        input_flow_limit = '450kW',
        output_flow_limit = '450kW'
      },
      picture = {
        filename = '__dark-tech__/graphics/entity/accumulator/basic-accumulator.png',
        priority = 'extra-high',
        width = 124,
        height = 103,
        shift = {0.7, -0.2}
      },
      charge_animation = {
        filename = '__dark-tech__/graphics/entity/accumulator/basic-accumulator-charge-animation.png',
        width = 138,
        height = 135,
        line_length = 8,
        frame_count = 24,
        shift = {0.482, -0.638},
        animation_speed = 0.5
      },
      charge_cooldown = 30,
      charge_light = {intensity = 0.3, size = 7},
      discharge_animation = {
        filename = '__dark-tech__/graphics/entity/accumulator/basic-accumulator-discharge-animation.png',
        width = 147,
        height = 128,
        line_length = 8,
        frame_count = 24,
        shift = {0.395, -0.525},
        animation_speed = 0.5
      },
      discharge_cooldown = 60,
      discharge_light = {intensity = 0.7, size = 7}
    },
    {
      type = 'accumulator',
      name = 'accumulator-MK2',
      fast_replaceable_group = 'accumulator',
      icon = '__dark-tech__/graphics/icons/accumulator/accumulator-MK2.png',
      icon_size = 32,
      flags = {'placeable-neutral', 'player-creation'},
      minable = {hardness = 0.2, mining_time = 0.5, result = 'accumulator-MK2'},
      max_health = 300,
      corpse = 'medium-remnants',
      collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
      selection_box = {{-1, -1}, {1, 1}},
      energy_source = {
        type = 'electric',
        buffer_capacity = '40MJ',
        usage_priority = 'tertiary',
        input_flow_limit = '1000kW',
        output_flow_limit = '1000kW'
      },
      picture = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-MK2.png',
        priority = 'extra-high',
        width = 124,
        height = 103,
        shift = {0.7, -0.2}
      },
      charge_animation = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-charge-animation-MK2.png',
        width = 138,
        height = 135,
        line_length = 8,
        frame_count = 24,
        shift = {0.482, -0.638},
        animation_speed = 0.5
      },
      charge_cooldown = 30,
      charge_light = {intensity = 0.3, size = 7},
      discharge_animation = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-discharge-animation-MK2.png',
        width = 147,
        height = 128,
        line_length = 8,
        frame_count = 24,
        shift = {0.395, -0.525},
        animation_speed = 0.5
      },
      discharge_cooldown = 60,
      discharge_light = {intensity = 0.7, size = 7}
    },
    {
      type = 'accumulator',
      name = 'accumulator-MK3',
      fast_replaceable_group = 'accumulator',
      icon = '__dark-tech__/graphics/icons/accumulator/accumulator-MK3.png',
      icon_size = 32,
      flags = {'placeable-neutral', 'player-creation'},
      minable = {hardness = 0.2, mining_time = 0.5, result = 'accumulator-MK3'},
      max_health = 450,
      corpse = 'medium-remnants',
      collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
      selection_box = {{-1, -1}, {1, 1}},
      energy_source = {
        type = 'electric',
        buffer_capacity = '160MJ',
        usage_priority = 'tertiary',
        input_flow_limit = '1600kW',
        output_flow_limit = '1600kW'
      },
      picture = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-MK3.png',
        priority = 'extra-high',
        width = 124,
        height = 103,
        shift = {0.7, -0.2}
      },
      charge_animation = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-charge-animation-MK3.png',
        width = 138,
        height = 135,
        line_length = 8,
        frame_count = 24,
        shift = {0.482, -0.638},
        animation_speed = 0.5
      },
      charge_cooldown = 30,
      charge_light = {intensity = 0.3, size = 7},
      discharge_animation = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-discharge-animation-MK3.png',
        width = 147,
        height = 128,
        line_length = 8,
        frame_count = 24,
        shift = {0.395, -0.525},
        animation_speed = 0.5
      },
      discharge_cooldown = 60,
      discharge_light = {intensity = 0.7, size = 7}
    },
    {
      type = 'accumulator',
      name = 'accumulator-MK4',
      fast_replaceable_group = 'accumulator',
      icon = '__dark-tech__/graphics/icons/accumulator/accumulator-MK4.png',
      icon_size = 32,
      flags = {'placeable-neutral', 'player-creation'},
      minable = {hardness = 0.2, mining_time = 0.5, result = 'accumulator-MK4'},
      max_health = 600,
      corpse = 'medium-remnants',
      collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
      selection_box = {{-1, -1}, {1, 1}},
      energy_source = {
        type = 'electric',
        buffer_capacity = '640MJ',
        usage_priority = 'tertiary',
        input_flow_limit = '6400kW',
        output_flow_limit = '6400kW'
      },
      picture = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-MK4.png',
        priority = 'extra-high',
        width = 124,
        height = 103,
        shift = {0.7, -0.2}
      },
      charge_animation = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-charge-animation-MK4.png',
        width = 138,
        height = 135,
        line_length = 8,
        frame_count = 24,
        shift = {0.482, -0.638},
        animation_speed = 0.5
      },
      charge_cooldown = 30,
      charge_light = {intensity = 0.3, size = 7},
      discharge_animation = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-discharge-animation-MK4.png',
        width = 147,
        height = 128,
        line_length = 8,
        frame_count = 24,
        shift = {0.395, -0.525},
        animation_speed = 0.5
      },
      discharge_cooldown = 60,
      discharge_light = {intensity = 0.7, size = 7}
    },
    {
      type = 'accumulator',
      name = 'accumulator-MK5',
      fast_replaceable_group = 'accumulator',
      icon = '__dark-tech__/graphics/icons/accumulator/accumulator-MK5.png',
      icon_size = 32,
      flags = {'placeable-neutral', 'player-creation'},
      minable = {hardness = 0.2, mining_time = 0.5, result = 'accumulator-MK5'},
      max_health = 750,
      corpse = 'medium-remnants',
      collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
      selection_box = {{-1, -1}, {1, 1}},
      energy_source = {
        type = 'electric',
        buffer_capacity = '2560MJ',
        usage_priority = 'tertiary',
        input_flow_limit = '25600kW',
        output_flow_limit = '25600kW'
      },
      picture = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-MK5.png',
        priority = 'extra-high',
        width = 124,
        height = 103,
        shift = {0.7, -0.2}
      },
      charge_animation = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-charge-animation-MK5.png',
        width = 138,
        height = 135,
        line_length = 8,
        frame_count = 24,
        shift = {0.482, -0.638},
        animation_speed = 0.5
      },
      charge_cooldown = 30,
      charge_light = {intensity = 0.3, size = 7},
      discharge_animation = {
        filename = '__dark-tech__/graphics/entity/accumulator/accumulator-discharge-animation-MK5.png',
        width = 147,
        height = 128,
        line_length = 8,
        frame_count = 24,
        shift = {0.395, -0.525},
        animation_speed = 0.5
      },
      discharge_cooldown = 60,
      discharge_light = {intensity = 0.7, size = 7}
    }
  }
)
