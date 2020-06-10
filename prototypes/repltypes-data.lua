--Create item groups and subgroups for replication-related things, the replicators and their materials
data:extend({
	{
		type = "item-group",
		name = "replication",
		icon = "__dark-tech__/graphics/icons/category-replicators.png",
		icon_size = 128,
		inventory_order = "g",
		order = "e"
	},
	{
		type = 'item-subgroup',
		name = 'replication-resources',
		group = 'replication',
		order = 'eb',
	},
	{
		type = 'item-subgroup',
		name = 'replicators',
		group = 'replication',
		order = 'ec'
	}
})

local repltype_data = {}
for name,repltype in pairs(repltypes) do
	--Also log whether or not each repltype is enabled
	repltype.enabled = settings.startup["repltype-"..name].value
	--Create an item subgroup for each enabled repltype
	if repltype.enabled then
		repltype_data[#repltype_data + 1] = {
			type = "item-subgroup",
			name = "replication-recipes-"..name,
			group = "replication",
			order = "ed-"..repltype.order,
		}
	end
end
data:extend(repltype_data)