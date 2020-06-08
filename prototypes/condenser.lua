data:extend(
  {
    {
      type = 'recipe',
      name = 'condenser',
      enabled = 'true',
      ingredients = {
        {'dark-matter-scoop', 100},
        {'iron-plate', 50},
        {'copper-plate', 50},
        {'matter-plate', 25}
      },
      result = 'condenser'
    },
    {
      type = 'item',
      name = 'condenser',
      icon = '__dark-tech__/graphics/icons/condenser.png',
      icon_size = 128,
      flags = {},
      subgroup = 'clean-power',
      order = 'e[accumulator]-a[basic-accumulator]',
      place_result = 'condenser',
      stack_size = 50
    },
    {
      type = 'assembling-machine',
      name = 'condenser',
      flags = {
        'placeable-player',
        'placeable-enemy',
        'player-creation',
        'placeable-off-grid',
        'not-on-map'
      },
      icon = '__dark-tech__/graphics/icons/condenser.png',
      icon_size = 128,
      flags = {'placeable-neutral', 'placeable-player', 'player-creation'},
      minable = {mining_time = 0.1, result = 'condenser'},
      max_health = 300,
      corpse = 'big-remnants',
      dying_explosion = 'medium-explosion',
      collision_box = {{-2.8, -2.2}, {2.2, 2.2}}, -- value = 1: left 2: up > 3: right 4: down
      selection_box = {{-2.8, -2.8}, {2.7, 2.6}},
      drawing_box = {{-1.5, -1.9}, {1.5, 1.5}},
      module_specification = {
        module_slots = 5
      },
      allowed_effects = {'consumption', 'speed', 'productivity', 'pollution'},
      animation = {
        filename = '__dark-tech__/graphics/entity/condenser.png',
        priority = 'high',
        width = 384,
        height = 384,
        frame_count = 16,
        line_length = 4,
        animation_speed = 1 / 3,
        scale = 0.5,
        shift = {0.5, 0}
      },
      working_sound = {
        sound = {
          {
            filename = '__base__/sound/chemical-plant.ogg',
            volume = 0.8
          }
        },
        idle_sound = {filename = '__base__/sound/idle1.ogg', volume = 0.6},
        apparent_volume = 1.5
      },
      crafting_speed = 1,
      energy_source = {
        type = 'electric',
        usage_priority = 'secondary-input',
        emissions_per_second_per_watt = 4 / 210000
      },
      energy_usage = '210kW',
      crafting_categories = {'chemistry'},
      fluid_boxes = {
        {
          production_type = 'input',
          pipe_picture = assembler2pipepictures(),
          pipe_covers = pipecoverspictures(),
          base_level = -1,
          pipe_connections = {{type = 'input', position = {0.0, 2.9}}}
        }
      }
    }
  }
)
