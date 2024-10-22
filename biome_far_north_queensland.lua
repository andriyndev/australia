-- mods/australia/biome_far_north_queensland.lua

minetest.register_biome({
	name = "far_north_queensland",
	--node_dust = "",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	--node_river_water = "",
	y_min = 4,
	y_max = 35,
	heat_point = 75,
	humidity_point = 90,
})



--
-- Register ores
--

-- All mapgens except singlenode
-- Blob ore first to avoid other ores inside blobs



--
-- Ferns
--

-- Big Tree Fern
for _, schem in ipairs(aus.schematics.big_tree_fern) do
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_grass"},
		y_min = 6,
		y_max = 20,
		fill_ratio = 0.003,
		biomes = {"far_north_queensland"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
	})
end

-- Giant Tree Fern
for _, schem in ipairs(aus.schematics.giant_tree_fern) do
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_grass"},
		y_min = 7,
		y_max = 18,
		fill_ratio = 0.005,
		biomes = {"far_north_queensland"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
	})
end

-- Small Tree Fern
for _, schem in ipairs(aus.schematics.small_tree_fern) do
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_grass"},
		y_min = 6,
		y_max = 21,
		fill_ratio = 0.01,
		biomes = {"far_north_queensland"},
		schematic = schem,
	})
end



--
-- Decorations
--

local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"far_north_queensland"},
		y_min = 5,
		y_max = 35,
		decoration = "default:grass_"..length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"far_north_queensland"},
		y_min = 22,
		y_max = 35,
		decoration = "default:dry_grass_"..length,
	})
end

	-- Grasses
register_grass_decoration(-0.03,  0.09,  5)
register_grass_decoration(-0.015, 0.075, 4)
register_grass_decoration(0,      0.06,  3)
register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

	-- Dry grasses
register_dry_grass_decoration(0.01, 0.05,  5)
register_dry_grass_decoration(0.03, 0.03,  4)



--
-- Ferns
--




--
-- Trees
--

	-- Daintree Stringybark
aus.schematics.daintree_stringybark_tree = {}
local max_r = 7
local ht = 10
local fruit = nil
local limbs = nil
local tree = "australia:daintree_stringybark_tree"
local leaves = "australia:daintree_stringybark_leaves"
for r = 6,max_r do
	local schem = aus.generate_tree_schematic(9, {x=r, y=ht, z=r}, tree, leaves, fruit, limbs)
	table.insert(aus.schematics.daintree_stringybark_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_grass"},
		y_min = 25,
		y_max = 35,
		fill_ratio = (max_r-r+1)/12000,
		biomes = {"far_north_queensland"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	-- Darwin Woollybutt
aus.schematics.darwin_woollybutt_tree = {}
local max_r = 4
local ht = 5
local fruit = nil
local limbs = nil
local tree = "australia:darwin_woollybutt_tree"
local leaves = "australia:darwin_woollybutt_leaves"
for r = 3,max_r do
	local schem = aus.generate_tree_schematic(6, {x=r, y=ht, z=r}, tree, leaves, fruit, limbs)
	table.insert(aus.schematics.darwin_woollybutt_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_grass"},
		y_min = 25,
		y_max = 35,
		fill_ratio = (max_r-r+1)/12000,
		biomes = {"far_north_queensland"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	-- Australian Fan Palm
aus.schematics.fan_palm_tree = {}
local max_ht = 9
local r = 3
local tree = "australia:fan_palm_tree"
local leaves = "australia:fan_palm_leaves"
for h = 9,max_ht do
	local schem = aus.generate_fanpalm_tree_schematic(max_ht, r, tree, leaves)
	table.insert(aus.schematics.fan_palm_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_grass"},
		fill_ratio = (max_ht-r+1)/300,
		biomes = {"far_north_queensland"},
		y_min = 5,
		y_max = 20,
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	-- Lemon Eucalyptus
aus.schematics.lemon_eucalyptus_tree = {}
local max_r = 5
local ht = 7
local fruit = nil
local limbs = nil
local tree = "australia:lemon_eucalyptus_tree"
local leaves = "australia:lemon_eucalyptus_leaves"
for r = 4,max_r do
	local schem = aus.generate_tree_schematic(8, {x=r, y=ht, z=r}, tree, leaves, fruit, limbs)
	table.insert(aus.schematics.lemon_eucalyptus_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_grass"},
		y_min = 20,
		y_max = 35,
		fill_ratio = (max_r-r+1)/12000,
		biomes = {"far_north_queensland"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	-- Lilly Pilly
aus.schematics.lilly_pilly_tree = {}
local max_r = 5
local ht = 8
local fruit = "australia:lilly_pilly_berries"
local limbs = false
local tree = "australia:lilly_pilly_tree"
local leaves = "australia:lilly_pilly_leaves"
for r = 4,max_r do
	local schem = aus.generate_tree_schematic(1, {x=r, y=ht, z=r}, tree, leaves, fruit, limbs)
	table.insert(aus.schematics.lilly_pilly_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_grass"},
		y_min = 20,
		y_max = 35,
		fill_ratio = (max_r-r+1)/12000,
		biomes = {"far_north_queensland"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	-- Merbau
aus.schematics.merbau_tree = {}
local max_ht = 12
local r = 8
local tree = "australia:merbau_tree"
local leaves = "australia:merbau_leaves"
for h = 8,max_ht do
	local schem = aus.generate_rainforest_tree_schematic(max_ht, r, tree, leaves)
	table.insert(aus.schematics.merbau_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_grass"},
		fill_ratio = (max_ht-r+1)/6000,
		biomes = {"far_north_queensland"},
		y_min = 6,
		y_max = 25,
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

	-- River Oak
aus.schematics.river_oak_big_tree = {}
local max_r = 5
local ht = 9
local fruit = nil
local limbs = false
local tree = "australia:river_oak_tree"
local leaves = "australia:river_oak_leaves"
for r = 4,max_r do
	local schem = aus.generate_tree_schematic(3, {x=r, y=ht, z=r}, tree, leaves, fruit, limbs)
	table.insert(aus.schematics.river_oak_big_tree, schem)
	minetest.register_decoration({
		deco_type = "schematic",
		sidelen = 80,
		place_on = {"default:dirt_with_grass"},
		y_min = 25,
		y_max = 35,
		fill_ratio = (max_r-r+1)/12000,
		biomes = {"far_north_queensland"},
		schematic = schem,
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
end

