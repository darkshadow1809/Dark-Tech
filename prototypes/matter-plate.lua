data:extend({
  {
    type = "recipe",
    name = "matter-plate",
	icon = '__dark-tech__/graphics/icons/matter-plate.png',
	icon_size = 32,
	flags = {"goes-to-main-inventory"},
    subgroup = "materials",
    order = "a[alien-bioconstruct]-a",
    category = "smelting",
    enabled = "true",
    energy_required = 10.5,
    ingredients = {{"tenemut", 1}},
    result = "matter-plate"
  },
  {
    type = "tool",
    name = "matter-plate",
    icon = "__dark-tech__/graphics/icons/matter-plate.png",
	icon_size = 32,
    flags = {},
    subgroup = "materials",
    order = "a[exo-skeleton]-a",
    stack_size = 50,
	durability = 1,
  },
 })