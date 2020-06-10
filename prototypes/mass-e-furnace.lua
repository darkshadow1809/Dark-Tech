data:extend({
    {
      type = "recipe-category",
      name = "triple-smelting"
    }
})

data:extend({
  {
    type = "technology",
    name = "electric-smelting-2",
    icon = "__replicators__/graphics/icons/Mass-E-Furnace.png",
	icon_size = 32,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "Mass-E-Furnace"
      }
    },
    prerequisites = {"repltech-replication-4"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"", 4},
        {"", 2},
	    {"", 2},
      },
      time = 20
    },
    order = "c-c-b"
  },
  {
    type = "item",
    name = "Mass-E-Furnace",
    icon = "__replicators__/graphics/icons/Mass-E-Furnace.png",
	icon_size = 32,
    flags = {},
    subgroup = "smelting-machine",
    order = "e[Mass-E-Furnace]",
    place_result = "Mass-E-Furnace",
    stack_size = 10
  },
  {
    type = "recipe",
    name = "Mass-E-Furnace",
    ingredients = {{"electronic-circuit", 5}, {"advanced-circuit", 10},{"ion-conduit", 12}, {"copper-plate", 50}, {"steel-plate", 25}},
    result = "Mass-E-Furnace",
    energy_required = 5,
    enabled = "false"
  },

  {
    type = "furnace",
    name = "Mass-E-Furnace",
    icon = "__replicators__/graphics/icons/Mass-E-Furnace.png",
	icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "Mass-E-Furnace"},
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "huge-explosion",
    light = {intensity = 1, size = 10},
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
    selection_box = {{-2, -2}, {2, 2}},
    module_slots = 3,
    crafting_categories = {"triple-smelting"},
    result_inventory_size = 3,
    crafting_speed = 1.5,
    energy_usage = "980kW",
    source_inventory_size = 3,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.012
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
      filename = "__replicators__/graphics/Mass-E-Furnace/electric-furnace-base.png",
      priority = "high",
      width = 129,
      height = 100,
      frame_count = 1,
      shift = {0.421875 * 15 / 12, 0},
      scale = 15 / 12
    },
    working_visualisations =
    {
      {
        animation =
        {
          filename = "__replicators__/graphics/Mass-E-Furnace/electric-furnace-heater.png",
          priority = "high",
          width = 25,
          height = 15,
          frame_count = 12,
          animation_speed = 0.75,
          shift = {0.015625* 15 / 12, 0.890625 * 15 / 12},
          scale = 15 / 12
        },
        light = {intensity = 0.4 * 1.5, size = 6 * 15 / 12, shift = {0.0, 1.0 * 15 / 12}}
      },
      {
        animation =
        {
          filename = "__replicators__/graphics/Mass-E-Furnace/electric-furnace-propeller-1.png",
          priority = "high",
          width = 19,
          height = 13,
          frame_count = 4,
          animation_speed = 0.75,
          shift = {-0.671875 * 15 / 12, -0.640625 * 15 / 12},
          scale = 15 / 12
        }
      },
      {
        animation =
        {
          filename = "__replicators__/graphics/Mass-E-Furnace/electric-furnace-propeller-2.png",
          priority = "high",
          width = 12,
          height = 9,
          frame_count = 4,
          animation_speed = 0.75,
          shift = {0.0625 * 15 / 12, -1.234375 * 15 / 12},
          scale = 15 / 12
        }
      }
    },
    fast_replaceable_group = "furnace"
  },

})
