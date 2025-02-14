--blocks

minetest.register_node( "titanium:titanium_in_ground", {
	description = "Titanium Ore",
	tiles  = { "default_stone.png^titanium_titanium_in_ground.png" },
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
	drop = 'craft "titanium:titanium" 1',
})

minetest.register_node( "titanium:block", {
	description = "Titanium Block",
	tiles  = { "titanium_block.png" },
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("titanium:glass", {
	description = "Titanium Glass",
	drawtype = "glasslike_framed_optional",
	tiles  = {"titanium_glass.png", "titanium_glass_stripes.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy=1,cracky=2,oddly_breakable_by_hand=2},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craftitem( "titanium:titanium", {
	description = "Titanium",
	inventory_image = "titanium_titanium.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_craftitem( "titanium:tougher_titanium", {
	description = "Tougher Titanium",
	inventory_image = "tougher_titanium.png",
	on_place_on_ground = minetest.craftitem_place_item,
})

minetest.register_node( "titanium:titanium_plate", {
	description = "Titanium Plate",
	tiles  = {"titanium_plate.png"},
	inventory_image = "titanium_plate.png",
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

--tools

minetest.register_tool("titanium:sword", {
	description = "Titanium Sword",
	inventory_image = "titanium_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			snappy={times={[2]=0.60, [3]=0.20}, uses=1000, maxlevel=1},
			choppy={times={[3]=0.70}, uses=1000, maxlevel=0}
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("titanium:axe", {
	description = "Titanium Axe",
	inventory_image = "titanium_axe.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.50, [3]=1.00}, uses=150, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("titanium:shovel", {
	description = "Titanium Shovel",
	inventory_image = "titanium_shovel.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.0, [2]=0.50, [3]=0.50}, uses=150, maxlevel=3}
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("titanium:pick", {
	description = "Titanium Pickaxe",
	inventory_image = "titanium_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=2.4, [2]=1.0, [3]=0.6}, uses=160, maxlevel=3},
			crumbly={times={[1]=2.4, [2]=1.0, [3]=0.6}, uses=160, maxlevel=3},
			snappy={times={[1]=2.4, [2]=1.0, [3]=0.6}, uses=160, maxlevel=3}
		},
		damage_groups = {fleshy=4},
	},
})

--crafting

minetest.register_craft({
	output = 'titanium:pick',
	recipe = {
		{'titanium:titanium', 'titanium:titanium', 'titanium:titanium'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'titanium:axe',
	recipe = {
		{'titanium:titanium', 'titanium:titanium', ''},
		{'titanium:titanium', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'titanium:shovel',
	recipe = {
		{'', 'titanium:titanium', ''},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'titanium:sword',
	recipe = {
		{'', 'titanium:titanium', ''},
		{'', 'titanium:titanium', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'titanium:block',
	recipe = {
		{'titanium:titanium', 'titanium:titanium', 'titanium:titanium'},
		{'titanium:titanium', 'titanium:titanium', 'titanium:titanium'},
		{'titanium:titanium', 'titanium:titanium', 'titanium:titanium'},
	}
})

minetest.register_craft({
	output = 'titanium:titanium 9',
	recipe = {
		{'titanium:block'},
	}
})

minetest.register_craft({
	output = 'titanium:glass',
	recipe = {
		{'', 'titanium:titanium', ''},
		{'titanium:titanium', 'default:glass', 'titanium:titanium'},
		{'', 'titanium:titanium', ''},
	}
})

minetest.register_craft({
	output = 'titanium:tougher_titanium',
	recipe = {
		{'titanium:titanium', 'titanium:titanium'},
		{'titanium:titanium', 'titanium:titanium'},
	}
})

minetest.register_craft({
	output = 'titanium:titanium_plate 9',
	recipe = {
		{'titanium:tougher_titanium', 'titanium:titanium', 'titanium:tougher_titanium'},
		{'titanium:titanium', 'titanium:tougher_titanium', 'titanium:titanium'},
		{'titanium:tougher_titanium', 'titanium:titanium', 'titanium:tougher_titanium'},
	}
})

minetest.register_ore({
	ore_type = "scatter",
	ore =      "titanium:titanium_in_ground",
	wherein =  "default:stone",
	noise_params = {
		offset = 0,
		scale = 1,
		spread = {x=100, y=100, z=100},
		seed = 21,
		octaves = 2,
		persist = 0.70,
	},
	clust_scarcity = 8192,
	clust_num_ores = 5,
	clust_size = 2,
	y_min = -31000,
	y_max = -1500,
})

local players = {}
local player_positions = {}
local last_wielded = {}

local function check_for_googles(player)
	if not player then return end
	local inv = player:get_inventory()
	if inv:contains_item("main", "titanium:sam_titanium") then
		return true
	end
	return false
end

minetest.register_on_joinplayer(function(player)
	local player_name = player:get_player_name()
	players[#players+1] = player_name
	last_wielded[player_name] = player:get_wielded_item():get_name()
	local pos = vector.round(player:get_pos())
	pos.y = pos.y+1
	if not check_for_googles(player) and minetest.get_node(pos).name == "titanium:light" then
		minetest.remove_node(pos)
	end
	player_positions[player_name] = pos
end)

minetest.register_on_leaveplayer(function(player)
	local player_name = player:get_player_name()
	for i,v in ipairs(players) do
		if v == player_name then
			table.remove(players, i)
			last_wielded[player_name] = nil
			player_positions[player_name] = nil
			local pos = vector.round(player:get_pos())
			pos.y = pos.y+1
			if minetest.get_node(pos).name == "titanium:light" then
				minetest.remove_node(pos)
			end
			return
		end
	end
end)

local timer = 0
minetest.register_globalstep(function(dtime)
	if dtime then
		timer = timer + dtime
		if timer > 0.3 then
			for _,player_name in ipairs(players) do
				local player = minetest.get_player_by_name(player_name)
				if check_for_googles(player) then
					local pos = vector.round(player:get_pos())
					pos.y = pos.y+1
					local new_pos = not vector.equals(pos, player_positions[player_name])
					if last_wielded[player_name] ~= "titanium:sam_titanium"
					or new_pos then
						if (minetest.get_node_light(pos) or 0) < 11 and minetest.get_node(pos).name == "air" then
							minetest.add_node(pos, {name="titanium:light"})
						end
						if new_pos then
							local old_pos = player_positions[player_name]
							if minetest.get_node(old_pos).name == "titanium:light" then
								minetest.remove_node(old_pos)
							end
						end
						player_positions[player_name] = pos
					end
					last_wielded[player_name] = nil
				elseif last_wielded[player_name] == "titanium:sam_titanium" then
					local pos = vector.round(vector.add(player:get_pos(), vector.multiply(player:get_velocity(), dtime*2)))
					pos.y = pos.y+1
					if minetest.get_node(pos).name == "titanium:light" then
						minetest.remove_node(pos)
					end
					local old_pos = player_positions[player_name]
					if minetest.get_node(old_pos).name == "titanium:light" then
						minetest.remove_node(old_pos)
					end
					last_wielded[player_name] = nil
				end
			end
		timer = 0
		end
	end
end)

minetest.register_node("titanium:light", {
	drawtype = "airlike",
	walkable = false,
	sunlight_propagates = true,
	buildable_to = true,
	pointable = false,
	drop = "",
	light_source = 11,
})

minetest.register_tool("titanium:sam_titanium", {
	description = "Google Glass Titanium",
	inventory_image = "sam_titanium.png",
	stack_max = 1,
	groups = {tool = 1},
	on_use = function()
	end,
})

minetest.register_craft({
	output = 'titanium:sam_titanium',
	recipe = {
		{'titanium:titanium_plate', 'default:torch', 'titanium:titanium_plate'},
		{'titanium:glass', 'default:mese_crystal', 'titanium:glass'},
	}
})

-- Cleanup for leftover and player-placed titanium lights
minetest.register_lbm({
	label = "Titanium light cleanup",
	name = "titanium:light_cleanup",
	nodenames = {"titanium:light"},
	run_at_every_load = true,
	action = function(pos)
		minetest.set_node(pos, {name = "air"})
	end,
})

minetest.log("info", "[Titanium Mod] Loaded!")
