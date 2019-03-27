--Load configuration settings which affect the replications
local reps_multiplier = settings.startup["replresearch-item-multiplier"].value
local research_time = settings.startup["replresearch-item-time"].value
local repl_penalty = settings.startup["replication-penalty"].value
local fluid_quantity = settings.startup["replication-fluid-quantity"].value

--Go through every replication and make the technologies and recipes for them
for _,current_replication in pairs(repl_table) do
	--Don't even spend time looking at replications from disabled recipes
	if current_replication.category.enabled then
		--Remove all items which do not exist
		local item_table = current_replication.items
		for currentItem=#item_table,1,-1 do
			if item_table[currentItem].pointer == nil then
				log("The item \""..item_table[currentItem].name.."\" was removed from the repltech \""..current_replication.name.."\" becuase the item in question does not exist.")
				table.remove(item_table, currentItem)
			end
		end
		
		--only make the technology if at least one item will be created
		if (#current_replication.items > 0) then
			--Set up temporary storage space for new data
			local repl_data = {}
			
			--Generate recipe data for each item
			local effects = {}
			for _,current_item in ipairs(current_replication.items) do
				--Calculate the item's cost and round it to the nearest single decimal place (minimum 0.1)
				local cost = current_item.cost
				if type(cost) ~= "number" then
					if type(cost) == "table" then
						log("Something went really wrong when it comes to the replication of \""..current_item.name.."\".  Somehow its cost table could not be processed into a number even though there are enough default cases that this should never be possible.  Maybe a replication is there twice or something.  Factorio is going to go and crash now.  Here's what the table itself looked like after somehow slipping through cost calculations: "..table.tostring(cost))
					else
						cost = tonumber(cost)
					end
				end
				if current_item.fluid then
					cost = cost * fluid_quantity
				end
				cost = math.floor((cost + repl_penalty) * 10 + 0.5) / 10
				if cost <= 0 then
					cost = 0.1
				end
				
				--Put whether the item is a fluid or not into string form
				local type
				local amount
				if current_item.fluid then
					type = "fluid"
					amount = fluid_quantity
				else
					type = "item"
					amount = 1
				end
				
				--Make the icon for the item
				local icon
				if current_item.pointer.icon then
					--Create a layered icon consisting of the item's icon underneath the replication border for this replication's category
					icon = {
						{icon = current_item.pointer.icon, icon_size = current_item.pointer.icon_size},
						{icon = "__dark-tech__/graphics/icons/borders/repl-"..current_replication.category.name..".png"}
					}
				elseif current_item.pointer.icons then
					--Create a copy of the item's already layered icon
					icon = {}
					for _,current_layer in ipairs(current_item.pointer.icons) do
						icon[#icon + 1] = current_layer
					end
					--Add the replication border as an extra layer
					icon[#icon + 1] = {
					{icon_size = 32},
					{icon = "__dark-tech__/graphics/icons/borders/repl-"..current_replication.category.name..".png"}
					}
				else
					log("The item "..current_item.pointer.name.." does not have an icon.  Factorio will now crash due to being unable to create a replication icon for it.  That and because the item itself does not have an icon.")
				end
				
				--Generate the recipe itself WITH LIQUID MATTER
				repl_data[#repl_data + 1] = {
					type = "recipe",
					name = "repl-"..(current_item.internal_name_override or current_item.name),
					category = "replication-"..current_replication.tier,
					enabled = false,
					energy_required = cost,
					ingredients = {{ type = "fluid", name = "eridium", amount = 1 + cost * 2 }},
					results = {{
						type = type,
						name = current_item.name,
						amount = amount
					}},
					icons = icon,
					icon_size = 32,
					subgroup = "replication-recipes-"..current_replication.category.name,
	--				order = 'z-z-'..current_replication.category.cat_order
				}
				
				
				--[[ --Generate the recipe with ENRICHED MATTER XXXXXXXXX 
				repl_data[#repl_data + 1] = {
					type = "recipe",
					name = "repl-"..(current_item.internal_name_override or current_item.name),
					category = "replication-"..current_replication.tier,
					enabled = false,
					energy_required = cost,
					ingredients = {{ type = "item", name = "enriched-matter", amount = 1 + cost * 0.2 }},
					results = {{
						type = type,
						name = current_item.name,
						amount = amount
					}},
					icons = icon,
					icon_size = 32,
					subgroup = "replication-recipes-"..current_replication.category.name,
	--				order = 'z-z-'..current_replication.category.cat_order
				}--]]
				--Create an unlock effect for this recipe
				effects[#effects + 1] = {type = "unlock-recipe", recipe = "repl-"..current_item.name}
			end
			
			--Get the technology's icon
			local tech_icon
            local tech_icon_size
			if current_replication.overrides.icon then
                tech_icon = {
                    {icon = current_replication.overrides.icon},
                    {icon = "__dark-tech__/graphics/icons/borders/tech-" .. current_replication.category.name .. ".png"}
                }
                tech_icon_size = 128
            else
                if repl_data[1].icons[1].icon_size == 128 then
                    tech_icon = {
                        repl_data[1].icons[1],
                        {icon = "__dark-tech__/graphics/icons/borders/tech-" .. current_replication.category.name .. ".png"}
                    }
                    tech_icon_size = 128

                    log(serpent.block(tech_icon))

                else
                    tech_icon = repl_data[1].icons
                    tech_icon_size = 32
                end
            end
			
			--Find and put together the pieces of the technology's display name
			local display_name = {"repltype-tech.display", {"repltype-tech."..current_replication.category.name}}
			local first_item = current_replication.items[1]
			if current_replication.overrides.localized_name then
				display_name[3] = current_replication.overrides.localized_name
			elseif first_item.pointer.localised_name then
				display_name[3] = first_item.pointer.localised_name
			elseif first_item.pointer.place_result then
				--If an item can be placed as an entity then its item display name defaults to that entity's display name during localization.  Many placable items do not have actual names of their own and instead use the names of their placed forms.
				display_name[3] = {"entity-name."..first_item.pointer.place_result}
			elseif first_item.fluid then
				display_name[3] = {"fluid-name."..first_item.pointer.name}
			else
				display_name[3] = {"item-name."..first_item.pointer.name}
			end
			
			--Generate technology data
			local upgrade = current_replication.overrides.upgrade
			if upgrade == nil then
				upgrade = current_replication.category.upgrade
			end
			local research_multiplier = current_replication.overrides.research_multiplier or current_replication.category.research_multiplier or 1
			repl_data[#repl_data + 1] = {
				type = "technology",
				name = "repl-"..current_replication.name,
				localised_name = display_name,
				icons = tech_icon,
				icon_size = tech_icon_size,
				effects = effects,
				prerequisites = current_replication.prerequisites,
				unit = repl_research(current_replication.tier, reps_multiplier * research_multiplier, research_time),
				upgrade = upgrade,
				order = "z-z-z"--"z-"..current_replication.category.order
			}
			
			--Add the new data to Factorio's main data structure
			data:extend(repl_data)
		else
			log("The repltech \""..current_replication.name.."\" was not created as a technology becuase it does not contain any replicatable items.")
		end
	end
end