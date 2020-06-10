data:extend({
  --[[ {
   - type = "technology",
    name = "electric-smelting",
    icon = "__dark-tech__/graphics/icons/small-electric-furnace.png",
	icon_size = 32,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "small-electric-furnace"
      }
    },
    prerequisites = {"dark-matter-scoop"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 30
    },
    order = "c-c-b"
  },--]]
  {
    type = "item",
    name = "small-electric-furnace",
    icon = "__dark-tech__/graphics/icons/small-electric-furnace.png",
	icon_size = 32,
    flags = {},
    subgroup = "smelting-machine",
    order = "c[small-electric-furnace]",
    place_result = "small-electric-furnace",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "small-electric-furnace",
    ingredients = {{"iron-plate", 20}, {"electronic-circuit", 5}},
    result = "small-electric-furnace",
    energy_required = 5,
    enabled = "true"
  },

  {
    type = "furnace",
    name = "small-electric-furnace",
    icon = "__dark-tech__/graphics/icons/small-electric-furnace.png",
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "small-electric-furnace"},
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    light = {intensity = 1, size = 10},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
    module_slots = 2,
    crafting_categories = {"smelting"},
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "80kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.000
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.7
      },
      apparent_volume = 1.5
    },
    animation =
    {
      filename = "__dark-tech__/graphics/small-electric-furnace/electric-furnace-base.png",
      priority = "high",
      width = 129,
      height = 100,
      frame_count = 1,
      shift = {0.421875, 0},
      scale = 0.66
    },
    working_visualisations =
    {
      {
        animation =
        {
          filename = "__dark-tech__/graphics/small-electric-furnace/electric-furnace-heater.png",
          priority = "high",
          width = 25,
          height = 15,
          frame_count = 12,
          animation_speed = 0.5,
          --shift = {0.015625, 0.890625},
          shift = {0.015625*0.66, 0.890625*0.66},
          scale = 0.66
        },
        light = {intensity = 0.4, size = 6, shift = {0.0, 1.0}}
      },
      {
        animation =
        {
          filename = "__dark-tech__/graphics/small-electric-furnace/electric-furnace-propeller-1.png",
          priority = "high",
          width = 19,
          height = 13,
          frame_count = 4,
          animation_speed = 0.5,
          --shift = {-0.671875, -0.640625},
          shift = {-0.671875 * 0.66, -0.640625 * 0.66},
          scale = 0.66
        }
      },
      {
        animation =
        {
          filename = "__dark-tech__/graphics/small-electric-furnace/electric-furnace-propeller-2.png",
          priority = "high",
          width = 12,
          height = 9,
          frame_count = 4,
          animation_speed = 0.5,
          --shift = {0.0625, -1.234375},
          shift = {0.0625 * 0.66, -1.234375 * 0.66},
          scale = 0.66
        }
      }
    },
    fast_replaceable_group = "furnace"
  },

})
