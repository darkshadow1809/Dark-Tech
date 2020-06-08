repltypes = {
  ore = {name = 'ore', tier = 1, order = 'a-a'}, --Semi-Random
  --Uusally one tech per item, mainly used for directly mineable ores and for directly pumpable fluids, tech image shows item

  element = {name = 'element', tier = 2, research_multiplier = 0.5, order = 'b-a'}, --Pure Element
  --One tech per used element, tech image is a periodic square containing a Bohr model

  shape = {name = 'shape', tier = 2, order = 'b-b'}, --Shaped Object
  --One tech per homogeneous semi-random or pure element substance that is shaped into items, tech image shows one or (preferably) more items

  alloy = {name = 'alloy', tier = 3, order = 'b-c'}, --Alloy & Shape
  --One tech per alloy, contains all items made entirely from said alloy

  chemical = {name = 'chemical', tier = 3, order = 'b-d'}, --Chemical & Shape
  --One tech per chemical, contains all items made entirely from said alloy

  device2 = {name = 'device2', tier = 2, order = 'c-a'}, --Very Simple
  device3 = {name = 'device3', tier = 3, order = 'c-b'}, --Simple
  device4 = {name = 'device4', tier = 4, order = 'c-c'}, --Complex
  device5 = {name = 'device5', tier = 5, order = 'c-d'}, --Very Complex
  --One tech per item or group of very similar items

  life = {name = 'life', tier = 5, order = 'e-a'}, --Living Thing
  --One tech per item, no image guidelines

  module = {name = 'module', tier = 5, order = 'e-b', upgrade = true}, --Module (sorting and border category only)
  --One tech per item
  --Unique in that technologies which unlock modules default to being upgrades; this should be set to false for the -1 modules
  --The tier should be overridden to 4 for -1 modules

  exotic = {name = 'exotic', order = 'e-c'}, --Exotic Matter (sorting and border category only)
  --Substances that cannot be categorized by normal matter, use guidelines for the closest real category

  magic = {name = 'magic', order = 'e-d'}, --Fantasy Material (sorting and border category only)
  --Supernatural substances originating from mythology, use guidelines for the closest real category

  alien = {name = 'alien', order = 'e-e'}, --??? (sorting and border category only)
  --Substances of alien origin, use guidelines for the closest real category

  science = {name = 'science', order = 'e-f'} --Science Pack (related techs must include manual tier and rep values)
  --One tech per pack, no image guidelines
}
