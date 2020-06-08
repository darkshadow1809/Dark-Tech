data:extend(
  {
    --requester

    {
      type = 'recipe',
      name = 'dark-tech-logistic-chest-requester',
      enabled = false,
      ingredients = {
        {'iron-chest', 1},
        {'dark-matter-scoop', 10},
        {'matter-plate', 10}
      },
      result = 'dark-tech-logistic-chest-requester'
    },
    {
      type = 'item',
      name = 'dark-tech-logistic-chest-requester',
      icon = '__base__/graphics/icons/logistic-chest-requester.png',
      icon_size = 32,
      subgroup = 'robots',
      order = 'b[storage]-e[logistic-chest-requester]',
      place_result = 'dark-tech-logistic-chest-requester',
      stack_size = 50
    },
    {
      type = 'logistic-container',
      name = 'dark-tech-logistic-chest-requester',
      icon = '__base__/graphics/icons/logistic-chest-requester.png',
      icon_size = 32,
      flags = {'placeable-player', 'player-creation'},
      minable = {mining_time = 0.1, result = 'dark-tech-logistic-chest-requester'},
      max_health = 350,
      corpse = 'small-remnants',
      collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      resistances = {
        {
          type = 'fire',
          percent = 90
        },
        {
          type = 'impact',
          percent = 60
        }
      },
      fast_replaceable_group = 'container',
      inventory_size = 5,
      logistic_mode = 'requester',
      logistic_slots_count = 12,
      open_sound = {filename = '__base__/sound/metallic-chest-open.ogg', volume = 0.65},
      close_sound = {filename = '__base__/sound/metallic-chest-close.ogg', volume = 0.7},
      vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
      opened_duration = logistic_chest_opened_duration,
      animation = {
        layers = {
          {
            filename = '__base__/graphics/entity/logistic-chest/logistic-chest-requester.png',
            priority = 'extra-high',
            width = 34,
            height = 38,
            frame_count = 7,
            shift = util.by_pixel(0, -2),
            hr_version = {
              filename = '__base__/graphics/entity/logistic-chest/hr-logistic-chest-requester.png',
              priority = 'extra-high',
              width = 66,
              height = 74,
              frame_count = 7,
              shift = util.by_pixel(0, -2),
              scale = 0.5
            }
          },
          {
            filename = '__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png',
            priority = 'extra-high',
            width = 48,
            height = 24,
            repeat_count = 7,
            shift = util.by_pixel(8.5, 5.5),
            draw_as_shadow = true,
            hr_version = {
              filename = '__base__/graphics/entity/logistic-chest/hr-logistic-chest-shadow.png',
              priority = 'extra-high',
              width = 96,
              height = 44,
              repeat_count = 7,
              shift = util.by_pixel(8.5, 5),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      circuit_wire_connection_point = circuit_connector_definitions['chest'].points,
      circuit_connector_sprites = circuit_connector_definitions['chest'].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance
    },
    --Active provider
    {
      type = 'recipe',
      name = 'dark-tech-logistic-chest-active-provider',
      enabled = false,
      ingredients = {
        {'iron-chest', 1},
        {'dark-matter-scoop', 10},
        {'matter-plate', 10}
      },
      result = 'dark-tech-logistic-chest-active-provider'
    },
    {
      type = 'item',
      name = 'dark-tech-logistic-chest-active-provider',
      icon = '__base__/graphics/icons/logistic-chest-active-provider.png',
      icon_size = 32,
      subgroup = 'robots',
      order = 'b[storage]-c[logistic-chest-active-provider]',
      place_result = 'dark-tech-logistic-chest-active-provider',
      stack_size = 50
    },
    {
      type = 'logistic-container',
      name = 'dark-tech-logistic-chest-active-provider',
      icon = '__base__/graphics/icons/logistic-chest-active-provider.png',
      icon_size = 32,
      flags = {'placeable-player', 'player-creation'},
      minable = {mining_time = 0.1, result = 'dark-tech-logistic-chest-active-provider'},
      max_health = 350,
      corpse = 'small-remnants',
      collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      resistances = {
        {
          type = 'fire',
          percent = 90
        },
        {
          type = 'impact',
          percent = 60
        }
      },
      fast_replaceable_group = 'container',
      inventory_size = 5,
      logistic_mode = 'active-provider',
      open_sound = {filename = '__base__/sound/metallic-chest-open.ogg', volume = 0.65},
      close_sound = {filename = '__base__/sound/metallic-chest-close.ogg', volume = 0.7},
      vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
      opened_duration = logistic_chest_opened_duration,
      animation = {
        layers = {
          {
            filename = '__base__/graphics/entity/logistic-chest/logistic-chest-active-provider.png',
            priority = 'extra-high',
            width = 34,
            height = 38,
            frame_count = 7,
            shift = util.by_pixel(0, -2),
            hr_version = {
              filename = '__base__/graphics/entity/logistic-chest/hr-logistic-chest-active-provider.png',
              priority = 'extra-high',
              width = 66,
              height = 74,
              frame_count = 7,
              shift = util.by_pixel(0, -2),
              scale = 0.5
            }
          },
          {
            filename = '__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png',
            priority = 'extra-high',
            width = 48,
            height = 24,
            repeat_count = 7,
            shift = util.by_pixel(8.5, 5.5),
            draw_as_shadow = true,
            hr_version = {
              filename = '__base__/graphics/entity/logistic-chest/hr-logistic-chest-shadow.png',
              priority = 'extra-high',
              width = 96,
              height = 44,
              repeat_count = 7,
              shift = util.by_pixel(8.5, 5),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      circuit_wire_connection_point = circuit_connector_definitions['chest'].points,
      circuit_connector_sprites = circuit_connector_definitions['chest'].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance
    },
    --Logistics robot
    {
      type = 'recipe',
      name = 'dark-tech-logistic-robot',
      enabled = false,
      ingredients = {
        {'dark-matter-scoop', 10},
        {'matter-plate', 20}
      },
      result = 'dark-tech-logistic-robot'
    },
    {
      type = 'item',
      name = 'dark-tech-logistic-robot',
      icon = '__base__/graphics/icons/logistic-robot.png',
      icon_size = 32,
      subgroup = 'robots',
      order = 'a[robot]-a[logistic-robot]',
      place_result = 'dark-tech-logistic-robot',
      stack_size = 50
    },
    {
      type = 'logistic-robot',
      name = 'dark-tech-logistic-robot',
      icon = '__base__/graphics/icons/logistic-robot.png',
      icon_size = 32,
      flags = {'placeable-player', 'player-creation', 'placeable-off-grid', 'not-on-map'},
      minable = {mining_time = 0.1, result = 'dark-tech-logistic-robot'},
      resistances = {{type = 'fire', percent = 85}},
      max_health = 100,
      collision_box = {{0, 0}, {0, 0}},
      selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
      max_payload_size = 1,
      speed = 0.07,
      transfer_distance = 0.5,
      max_energy = '2MJ',
      energy_per_tick = '0.05kJ',
      speed_multiplier_when_out_of_energy = 0.6,
      energy_per_move = '8kJ',
      min_to_charge = 0.1,
      max_to_charge = 0.95,
      idle = {
        filename = '__base__/graphics/entity/logistic-robot/logistic-robot.png',
        priority = 'high',
        line_length = 16,
        width = 41,
        height = 42,
        frame_count = 1,
        shift = {0.015625, -0.09375},
        direction_count = 16,
        y = 42,
        hr_version = {
          filename = '__base__/graphics/entity/logistic-robot/hr-logistic-robot.png',
          priority = 'high',
          line_length = 16,
          width = 80,
          height = 84,
          frame_count = 1,
          shift = util.by_pixel(0, -3),
          direction_count = 16,
          y = 84,
          scale = 0.5
        }
      },
      idle_with_cargo = {
        filename = '__base__/graphics/entity/logistic-robot/logistic-robot.png',
        priority = 'high',
        line_length = 16,
        width = 41,
        height = 42,
        frame_count = 1,
        shift = {0.015625, -0.09375},
        direction_count = 16,
        hr_version = {
          filename = '__base__/graphics/entity/logistic-robot/hr-logistic-robot.png',
          priority = 'high',
          line_length = 16,
          width = 80,
          height = 84,
          frame_count = 1,
          shift = util.by_pixel(0, -3),
          direction_count = 16,
          scale = 0.5
        }
      },
      in_motion = {
        filename = '__base__/graphics/entity/logistic-robot/logistic-robot.png',
        priority = 'high',
        line_length = 16,
        width = 41,
        height = 42,
        frame_count = 1,
        shift = {0.015625, -0.09375},
        direction_count = 16,
        y = 126,
        hr_version = {
          filename = '__base__/graphics/entity/logistic-robot/hr-logistic-robot.png',
          priority = 'high',
          line_length = 16,
          width = 80,
          height = 84,
          frame_count = 1,
          shift = util.by_pixel(0, -3),
          direction_count = 16,
          y = 252,
          scale = 0.5
        }
      },
      in_motion_with_cargo = {
        filename = '__base__/graphics/entity/logistic-robot/logistic-robot.png',
        priority = 'high',
        line_length = 16,
        width = 41,
        height = 42,
        frame_count = 1,
        shift = {0.015625, -0.09375},
        direction_count = 16,
        y = 84,
        hr_version = {
          filename = '__base__/graphics/entity/logistic-robot/hr-logistic-robot.png',
          priority = 'high',
          line_length = 16,
          width = 80,
          height = 84,
          frame_count = 1,
          shift = util.by_pixel(0, -3),
          direction_count = 16,
          y = 168,
          scale = 0.5
        }
      },
      shadow_idle = {
        filename = '__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png',
        priority = 'high',
        line_length = 16,
        width = 59,
        height = 23,
        frame_count = 1,
        shift = {0.96875, 0.609375},
        direction_count = 16,
        y = 23,
        hr_version = {
          filename = '__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png',
          priority = 'high',
          line_length = 16,
          width = 115,
          height = 57,
          frame_count = 1,
          shift = util.by_pixel(31.75, 19.75),
          direction_count = 16,
          y = 57,
          scale = 0.5
        }
      },
      shadow_idle_with_cargo = {
        filename = '__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png',
        priority = 'high',
        line_length = 16,
        width = 59,
        height = 23,
        frame_count = 1,
        shift = {0.96875, 0.609375},
        direction_count = 16,
        hr_version = {
          filename = '__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png',
          priority = 'high',
          line_length = 16,
          width = 115,
          height = 57,
          frame_count = 1,
          shift = util.by_pixel(31.75, 19.75),
          direction_count = 16,
          scale = 0.5
        }
      },
      shadow_in_motion = {
        filename = '__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png',
        priority = 'high',
        line_length = 16,
        width = 59,
        height = 23,
        frame_count = 1,
        shift = {0.96875, 0.609375},
        direction_count = 16,
        y = 23,
        hr_version = {
          filename = '__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png',
          priority = 'high',
          line_length = 16,
          width = 115,
          height = 57,
          frame_count = 1,
          shift = util.by_pixel(31.75, 19.75),
          direction_count = 16,
          y = 171,
          scale = 0.5
        }
      },
      shadow_in_motion_with_cargo = {
        filename = '__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png',
        priority = 'high',
        line_length = 16,
        width = 59,
        height = 23,
        frame_count = 1,
        shift = {0.96875, 0.609375},
        direction_count = 16,
        hr_version = {
          filename = '__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png',
          priority = 'high',
          line_length = 16,
          width = 115,
          height = 57,
          frame_count = 1,
          shift = util.by_pixel(31.75, 19.75),
          direction_count = 16,
          y = 114,
          scale = 0.5
        }
      },
      working_sound = flying_robot_sounds(),
      cargo_centered = {0.0, 0.2}
    },
    --Construction robot
    {
      type = 'recipe',
      name = 'dark-tech-construction-robot',
      enabled = false,
      ingredients = {
        {'matter-plate', 10},
        {'dark-matter-scoop', 20}
      },
      result = 'dark-tech-construction-robot'
    },
    {
      type = 'item',
      name = 'dark-tech-construction-robot',
      icon = '__base__/graphics/icons/construction-robot.png',
      icon_size = 32,
      subgroup = 'robots',
      order = 'a[robot]-b[construction-robot]',
      place_result = 'dark-tech-construction-robot',
      stack_size = 50
    },
    {
      type = 'construction-robot',
      name = 'dark-tech-construction-robot',
      icon = '__base__/graphics/icons/construction-robot.png',
      icon_size = 32,
      flags = {'placeable-player', 'player-creation', 'placeable-off-grid', 'not-on-map'},
      minable = {mining_time = 0.1, result = 'construction-robot'},
      resistances = {{type = 'fire', percent = 85}},
      max_health = 100,
      collision_box = {{0, 0}, {0, 0}},
      selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
      max_payload_size = 1,
      speed = 0.07,
      transfer_distance = 0.5,
      max_energy = '2.5MJ',
      energy_per_tick = '0.05kJ',
      speed_multiplier_when_out_of_energy = 0.6,
      energy_per_move = '8kJ',
      min_to_charge = 0.1,
      max_to_charge = 0.95,
      working_light = {intensity = 0.8, size = 3, color = {r = 0.8, g = 0.8, b = 0.8}},
      idle = {
        filename = '__base__/graphics/entity/construction-robot/construction-robot.png',
        priority = 'high',
        line_length = 16,
        width = 32,
        height = 36,
        frame_count = 1,
        shift = {0, -0.15625},
        direction_count = 16,
        hr_version = {
          filename = '__base__/graphics/entity/construction-robot/hr-construction-robot.png',
          priority = 'high',
          line_length = 16,
          width = 66,
          height = 76,
          frame_count = 1,
          shift = util.by_pixel(0, -4.5),
          direction_count = 16,
          scale = 0.5
        }
      },
      in_motion = {
        filename = '__base__/graphics/entity/construction-robot/construction-robot.png',
        priority = 'high',
        line_length = 16,
        width = 32,
        height = 36,
        frame_count = 1,
        shift = {0, -0.15625},
        direction_count = 16,
        y = 36,
        hr_version = {
          filename = '__base__/graphics/entity/construction-robot/hr-construction-robot.png',
          priority = 'high',
          line_length = 16,
          width = 66,
          height = 76,
          frame_count = 1,
          shift = util.by_pixel(0, -4.5),
          direction_count = 16,
          y = 76,
          scale = 0.5
        }
      },
      shadow_idle = {
        filename = '__base__/graphics/entity/construction-robot/construction-robot-shadow.png',
        priority = 'high',
        line_length = 16,
        width = 50,
        height = 24,
        frame_count = 1,
        shift = {1.09375, 0.59375},
        direction_count = 16,
        hr_version = {
          filename = '__base__/graphics/entity/construction-robot/hr-construction-robot-shadow.png',
          priority = 'high',
          line_length = 16,
          width = 104,
          height = 49,
          frame_count = 1,
          shift = util.by_pixel(33.5, 18.75),
          direction_count = 16,
          scale = 0.5
        }
      },
      shadow_in_motion = {
        filename = '__base__/graphics/entity/construction-robot/construction-robot-shadow.png',
        priority = 'high',
        line_length = 16,
        width = 50,
        height = 24,
        frame_count = 1,
        shift = {1.09375, 0.59375},
        direction_count = 16,
        hr_version = {
          filename = '__base__/graphics/entity/construction-robot/hr-construction-robot-shadow.png',
          priority = 'high',
          line_length = 16,
          width = 104,
          height = 49,
          frame_count = 1,
          shift = util.by_pixel(33.5, 18.75),
          direction_count = 16,
          scale = 0.5
        }
      },
      working = {
        filename = '__base__/graphics/entity/construction-robot/construction-robot-working.png',
        priority = 'high',
        line_length = 2,
        width = 28,
        height = 36,
        frame_count = 2,
        shift = {0, -0.15625},
        direction_count = 16,
        animation_speed = 0.3,
        hr_version = {
          filename = '__base__/graphics/entity/construction-robot/hr-construction-robot-working.png',
          priority = 'high',
          line_length = 2,
          width = 57,
          height = 74,
          frame_count = 2,
          shift = util.by_pixel(-0.25, -5),
          direction_count = 16,
          animation_speed = 0.3,
          scale = 0.5
        }
      },
      shadow_working = {
        stripes = util.multiplystripes(
          2,
          {
            {
              filename = '__base__/graphics/entity/construction-robot/construction-robot-shadow.png',
              width_in_frames = 16,
              height_in_frames = 1
            }
          }
        ),
        priority = 'high',
        width = 50,
        height = 24,
        frame_count = 2,
        shift = {1.09375, 0.59375},
        direction_count = 16
      },
      smoke = {
        filename = '__base__/graphics/entity/smoke-construction/smoke-01.png',
        width = 39,
        height = 32,
        frame_count = 19,
        line_length = 19,
        shift = {0.078125, -0.15625},
        animation_speed = 0.3
      },
      sparks = {
        {
          filename = '__base__/graphics/entity/sparks/sparks-01.png',
          width = 39,
          height = 34,
          frame_count = 19,
          line_length = 19,
          shift = {-0.109375, 0.3125},
          tint = {r = 1.0, g = 0.9, b = 0.0, a = 1.0},
          animation_speed = 0.3
        },
        {
          filename = '__base__/graphics/entity/sparks/sparks-02.png',
          width = 36,
          height = 32,
          frame_count = 19,
          line_length = 19,
          shift = {0.03125, 0.125},
          tint = {r = 1.0, g = 0.9, b = 0.0, a = 1.0},
          animation_speed = 0.3
        },
        {
          filename = '__base__/graphics/entity/sparks/sparks-03.png',
          width = 42,
          height = 29,
          frame_count = 19,
          line_length = 19,
          shift = {-0.0625, 0.203125},
          tint = {r = 1.0, g = 0.9, b = 0.0, a = 1.0},
          animation_speed = 0.3
        },
        {
          filename = '__base__/graphics/entity/sparks/sparks-04.png',
          width = 40,
          height = 35,
          frame_count = 19,
          line_length = 19,
          shift = {-0.0625, 0.234375},
          tint = {r = 1.0, g = 0.9, b = 0.0, a = 1.0},
          animation_speed = 0.3
        },
        {
          filename = '__base__/graphics/entity/sparks/sparks-05.png',
          width = 39,
          height = 29,
          frame_count = 19,
          line_length = 19,
          shift = {-0.109375, 0.171875},
          tint = {r = 1.0, g = 0.9, b = 0.0, a = 1.0},
          animation_speed = 0.3
        },
        {
          filename = '__base__/graphics/entity/sparks/sparks-06.png',
          width = 44,
          height = 36,
          frame_count = 19,
          line_length = 19,
          shift = {0.03125, 0.3125},
          tint = {r = 1.0, g = 0.9, b = 0.0, a = 1.0},
          animation_speed = 0.3
        }
      },
      working_sound = flying_robot_sounds(),
      cargo_centered = {0.0, 0.2},
      construction_vector = {0.30, 0.22}
    },
    --Logistic chest storage
    {
      type = 'recipe',
      name = 'dark-tech-logistic-chest-storage',
      enabled = false,
      ingredients = {
        {'iron-chest', 1},
        {'dark-matter-scoop', 10},
        {'matter-plate', 10}
      },
      result = 'dark-tech-logistic-chest-storage'
    },
    {
      type = 'item',
      name = 'dark-tech-logistic-chest-storage',
      icon = '__base__/graphics/icons/logistic-chest-storage.png',
      icon_size = 32,
      subgroup = 'robots',
      order = 'b[storage]-c[dark-tech-logistic-chest-storage]',
      place_result = 'dark-tech-logistic-chest-storage',
      stack_size = 50
    },
    {
      type = 'logistic-container',
      name = 'dark-tech-logistic-chest-storage',
      icon = '__base__/graphics/icons/logistic-chest-storage.png',
      icon_size = 32,
      flags = {'placeable-player', 'player-creation'},
      minable = {mining_time = 0.1, result = 'dark-tech-logistic-chest-storage'},
      max_health = 350,
      logistic_slots_count = 1,
      corpse = 'small-remnants',
      collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      resistances = {
        {
          type = 'fire',
          percent = 90
        },
        {
          type = 'impact',
          percent = 60
        }
      },
      fast_replaceable_group = 'container',
      inventory_size = 5,
      logistic_mode = 'storage',
      open_sound = {filename = '__base__/sound/metallic-chest-open.ogg', volume = 0.65},
      close_sound = {filename = '__base__/sound/metallic-chest-close.ogg', volume = 0.7},
      vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
      opened_duration = logistic_chest_opened_duration,
      animation = {
        layers = {
          {
            filename = '__base__/graphics/entity/logistic-chest/logistic-chest-storage.png',
            priority = 'extra-high',
            width = 34,
            height = 38,
            frame_count = 7,
            shift = util.by_pixel(0, -2),
            hr_version = {
              filename = '__base__/graphics/entity/logistic-chest/hr-logistic-chest-storage.png',
              priority = 'extra-high',
              width = 66,
              height = 74,
              frame_count = 7,
              shift = util.by_pixel(0, -2),
              scale = 0.5
            }
          },
          {
            filename = '__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png',
            priority = 'extra-high',
            width = 48,
            height = 24,
            repeat_count = 7,
            shift = util.by_pixel(8.5, 5.5),
            draw_as_shadow = true,
            hr_version = {
              filename = '__base__/graphics/entity/logistic-chest/hr-logistic-chest-shadow.png',
              priority = 'extra-high',
              width = 96,
              height = 44,
              repeat_count = 7,
              shift = util.by_pixel(8.5, 5),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      circuit_wire_connection_point = circuit_connector_definitions['chest'].points,
      circuit_connector_sprites = circuit_connector_definitions['chest'].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance
    },
    --Logistics chest passive
    {
      type = 'recipe',
      name = 'dark-tech-logistic-chest-passive-provider',
      enabled = false,
      ingredients = {
        {'iron-chest', 1},
        {'dark-matter-scoop', 10},
        {'matter-plate', 10}
      },
      result = 'dark-tech-logistic-chest-passive-provider'
    },
    {
      type = 'item',
      name = 'dark-tech-logistic-chest-passive-provider',
      icon = '__base__/graphics/icons/logistic-chest-passive-provider.png',
      icon_size = 32,
      subgroup = 'robots',
      order = 'b[storage]-c[dark-tech-logistic-chest-passive-provider]',
      place_result = 'dark-tech-logistic-chest-passive-provider',
      stack_size = 50
    },
    {
      type = 'logistic-container',
      name = 'dark-tech-logistic-chest-passive-provider',
      icon = '__base__/graphics/icons/logistic-chest-passive-provider.png',
      icon_size = 32,
      flags = {'placeable-player', 'player-creation'},
      minable = {mining_time = 0.1, result = 'dark-tech-logistic-chest-passive-provider'},
      max_health = 350,
      corpse = 'small-remnants',
      collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      resistances = {
        {
          type = 'fire',
          percent = 90
        },
        {
          type = 'impact',
          percent = 60
        }
      },
      fast_replaceable_group = 'container',
      inventory_size = 5,
      logistic_mode = 'passive-provider',
      open_sound = {filename = '__base__/sound/metallic-chest-open.ogg', volume = 0.65},
      close_sound = {filename = '__base__/sound/metallic-chest-close.ogg', volume = 0.7},
      vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
      opened_duration = logistic_chest_opened_duration,
      animation = {
        layers = {
          {
            filename = '__base__/graphics/entity/logistic-chest/logistic-chest-passive-provider.png',
            priority = 'extra-high',
            width = 34,
            height = 38,
            frame_count = 7,
            shift = util.by_pixel(0, -2),
            hr_version = {
              filename = '__base__/graphics/entity/logistic-chest/hr-logistic-chest-passive-provider.png',
              priority = 'extra-high',
              width = 66,
              height = 74,
              frame_count = 7,
              shift = util.by_pixel(0, -2),
              scale = 0.5
            }
          },
          {
            filename = '__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png',
            priority = 'extra-high',
            width = 48,
            height = 24,
            repeat_count = 7,
            shift = util.by_pixel(8.5, 5.5),
            draw_as_shadow = true,
            hr_version = {
              filename = '__base__/graphics/entity/logistic-chest/hr-logistic-chest-shadow.png',
              priority = 'extra-high',
              width = 96,
              height = 44,
              repeat_count = 7,
              shift = util.by_pixel(8.5, 5),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      circuit_wire_connection_point = circuit_connector_definitions['chest'].points,
      circuit_connector_sprites = circuit_connector_definitions['chest'].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance
    },
    --Roboport
    {
      type = 'recipe',
      name = 'dark-tech-roboport',
      enabled = false,
      ingredients = {
        {'wood', 10},
        {'stone', 5},
        {'dark-matter-scoop', 3},
        {'iron-plate', 45},
        {'copper-plate', 45},
        {'matter-plate', 30}
      },
      result = 'dark-tech-roboport',
      energy_required = 15
    },
    {
      type = 'item',
      name = 'dark-tech-roboport',
      icon = '__base__/graphics/icons/roboport.png',
      icon_size = 32,
      flags = {},
      subgroup = 'robots',
      order = 'a[exo-skeleton]-a',
      place_result = 'dark-tech-roboport',
      stack_size = 10
    },
    {
      type = 'roboport',
      name = 'dark-tech-roboport',
      icon = '__base__/graphics/icons/roboport.png',
      icon_size = 32,
      flags = {'placeable-player', 'player-creation'},
      minable = {hardness = 0.2, mining_time = 0.5, result = 'dark-tech-roboport'},
      max_health = 500,
      corpse = 'big-remnants',
      collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
      selection_box = {{-2, -2}, {2, 2}},
      dying_explosion = 'medium-explosion',
      energy_source = {
        type = 'electric',
        usage_priority = 'secondary-input',
        input_flow_limit = '2MW',
        buffer_capacity = '48MJ'
      },
      recharge_minimum = '10MJ',
      energy_usage = '150kW',
      -- per one charge slot
      charging_energy = '700kW',
      logistics_radius = 25,
      construction_radius = 50,
      charge_approach_distance = 5,
      robot_slots_count = 2,
      material_slots_count = 2,
      stationing_offset = {0, 0},
      charging_offsets = {
        {-1.5, -0.5},
        {1.5, -0.5},
        {1.5, 1.5},
        {-1.5, 1.5}
      },
      base = {
        filename = '__base__/graphics/entity/roboport/roboport-base.png',
        width = 143,
        height = 135,
        shift = {0.5, 0.25}
      },
      base_patch = {
        filename = '__base__/graphics/entity/roboport/roboport-base-patch.png',
        priority = 'medium',
        width = 69,
        height = 50,
        frame_count = 1,
        shift = {0.03125, 0.203125}
      },
      base_animation = {
        filename = '__base__/graphics/entity/roboport/roboport-base-animation.png',
        priority = 'medium',
        width = 42,
        height = 31,
        frame_count = 8,
        animation_speed = 0.5,
        shift = {-0.5315, -1.9375}
      },
      door_animation_up = {
        filename = '__base__/graphics/entity/roboport/roboport-door-up.png',
        priority = 'medium',
        width = 52,
        height = 20,
        frame_count = 16,
        shift = {0.015625, -0.890625}
      },
      door_animation_down = {
        filename = '__base__/graphics/entity/roboport/roboport-door-down.png',
        priority = 'medium',
        width = 52,
        height = 22,
        frame_count = 16,
        shift = {0.015625, -0.234375}
      },
      recharging_animation = {
        filename = '__base__/graphics/entity/roboport/roboport-recharging.png',
        priority = 'high',
        width = 37,
        height = 35,
        frame_count = 16,
        scale = 1.5,
        animation_speed = 0.5
      },
      vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
      working_sound = {
        sound = {filename = '__base__/sound/roboport-working.ogg', volume = 0.6},
        max_sounds_per_type = 3,
        audible_distance_modifier = 0.5,
        probability = 1 / (5 * 60) -- average pause between the sound is 5 seconds
      },
      recharging_light = {intensity = 0.4, size = 5},
      request_to_open_door_timeout = 15,
      spawn_and_station_height = -0.1,
      radius_visualisation_picture = {
        filename = '__base__/graphics/entity/roboport/roboport-radius-visualization.png',
        width = 12,
        height = 12,
        priority = 'extra-high-no-scale'
      },
      construction_radius_visualisation_picture = {
        filename = '__base__/graphics/entity/roboport/roboport-construction-radius-visualization.png',
        width = 12,
        height = 12,
        priority = 'extra-high-no-scale'
      },
      open_door_trigger_effect = {
        {
          type = 'play-sound',
          sound = {filename = '__base__/sound/roboport-door.ogg', volume = 1.2}
        }
      },
      close_door_trigger_effect = {
        {
          type = 'play-sound',
          sound = {filename = '__base__/sound/roboport-door.ogg', volume = 0.75}
        }
      }
    }
  }
)
