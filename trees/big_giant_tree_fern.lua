-- Giant tree fern sapling
minetest.register_node("australia:sapling_giant_tree_fern", {
	description = "Dicksonia Antarctica: Giant Tree Fern Sapling",
	drawtype = "plantlike",
	paramtype = "light",
	tiles = {"aus_sapling_tree_fern_giant.png"},
	inventory_image = "aus_sapling_tree_fern_giant.png",
	walkable = false,
	groups = {snappy=3,flammable=2,attached_node=1,sapling=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})

-- Giant tree fern leaves
minetest.register_node("australia:tree_fern_leaves_giant", {
	description = "Dicksonia Antarctica: Giant Tree Fern Crown",
	drawtype = "plantlike",
	visual_scale = math.sqrt(8),
	wield_scale = {x=0.175, y=0.175, z=0.175},
	paramtype = "light",
	tiles = {"aus_fern_tree_giant.png"},
	inventory_image = "aus_fern_tree.png",
	walkable = false,
	groups = {
		snappy=3,
		flammable=2,
		attached_node=1,
		leaves=1
	},
	drop = {
		max_items = 1,
		items = {
			{
				items = {"australia:sapling_giant_tree_fern"},
				rarity = 10,
			},
			{
				items = {"australia:tree_fern_leaves_giant"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})

-- Giant tree fern leaf part
minetest.register_node("australia:tree_fern_leaf_big", {
	description = "Dicksonia Antarctica: Giant Tree Fern Leaves",
	drawtype = "raillike",
	paramtype = "light",
	tiles = {
		"aus_tree_fern_leaf_big.png",
	},
	walkable = false,
	groups = {
		snappy=3,
		flammable=2,
		attached_node=1,
		leaves=1,
		not_in_creative_inventory=1
	},
	drop = "",
	sounds = default.node_sound_leaves_defaults(),
})

-- Giant tree fern leaf end
minetest.register_node("australia:tree_fern_leaf_big_end", {
	description = "Dicksonia Antarctica: Giant Tree Fern Leaf End",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = { "aus_tree_fern_leaf_big_end.png" },
	use_texture_alpha = "clip",
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2,   1/2, 1/2,   33/64, 1/2},
	},
	groups = {
		snappy=3,
		flammable=2,
		attached_node=1,
		leaves=1,
		not_in_creative_inventory=1
	},
	drop = "",
	sounds = default.node_sound_leaves_defaults(),
})

-- Giant tree fern trunk top
minetest.register_node("australia:fern_trunk_big_top", {
	description = "Dicksonia Antarctica: Giant Tree Fern Trunk",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"aus_fern_trunk_big_top.png^aus_tree_fern_leaf_big_cross.png",
		"aus_fern_trunk_big_top.png^aus_tree_fern_leaf_big_cross.png",
		"aus_fern_trunk_big.png"
	},
	use_texture_alpha = "clip",
	node_box = {
		type = "fixed",
		fixed = {
			{-1/2,  33/64, -1/2, 1/2, 33/64, 1/2},
			{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	groups = {
		tree=1,
		choppy=2,
		oddly_breakable_by_hand=2,
		flammable=3,
		wood=1,
		not_in_creative_inventory=1,
		leafdecay=3 -- to support vines
	},
	drop = "australia:fern_trunk_big",
	sounds = default.node_sound_wood_defaults(),
})

-- Giant tree fern trunk
minetest.register_node("australia:fern_trunk_big", {
	description = "Dicksonia Antarctica: Giant Tree Fern Trunk",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"aus_fern_trunk_big_top.png",
		"aus_fern_trunk_big_top.png",
		"aus_fern_trunk_big.png"
	},
	use_texture_alpha = "clip",
	node_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/4, -1/2, -1/4, 1/4, 1/2, 1/4},
	},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
	after_destruct = function(pos,oldnode)
		local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
		if node.name == "australia:fern_trunk_big" or node.name == "australia:fern_trunk_big_top" then
			minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z})
		end
	end,
})

local n1, n2, n3, n4, n5, n6, n7, n8, n9

n1 = { name = "air", prob = 0 }
n2 = { name = "australia:tree_fern_leaf_big_end" }
n3 = { name = "australia:tree_fern_leaf_big" }
n4 = { name = "australia:fern_trunk_big" }
n5 = { name = "australia:tree_fern_leaf_big_end", param2 = 1 }
n6 = { name = "australia:fern_trunk_big_top" }
n7 = { name = "australia:tree_fern_leaf_big_end", param2 = 3 }
n8 = { name = "australia:tree_fern_leaves_giant" }
n9 = { name = "australia:tree_fern_leaf_big_end", param2 = 2 }
aus.schematics.big_tree_fern = {
	{
		size = {y = 7, x = 9, z = 9},
		data = {
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n3, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n3, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n4, n1, n1, n1, n1, n1, n1, n1, n1, n4, n1, n1, n1, n1, n1, n1,
			n1, n1, n4, n1, n1, n1, n1, n1, n1, n1, n1, n4, n1, n1, n1, n1, n5,
			n1, n1, n1, n6, n1, n1, n1, n7, n1, n3, n1, n3, n8, n3, n1, n3, n1,
			n1, n1, n3, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n3, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n3, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n9, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1,
		},
		yslice_prob = {},
	}
}

n1 = { name = "air", prob = 0 }
n2 = { name = "australia:tree_fern_leaf_big_end" }
n3 = { name = "australia:tree_fern_leaf_big" }
n4 = { name = "australia:fern_trunk_big" }
n5 = { name = "australia:tree_fern_leaf_big_end", param2 = 1 }
n6 = { name = "australia:fern_trunk_big_top" }
n7 = { name = "australia:tree_fern_leaf_big_end", param2 = 3 }
n8 = { name = "australia:tree_fern_leaves_giant" }
n9 = { name = "australia:tree_fern_leaf_big_end", param2 = 2 }
aus.schematics.giant_tree_fern = {
	{
		size = {y = 13, x = 9, z = 9},
		data = {
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n2, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n3,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n3, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n4, n1, n1, n1,
			n1, n1, n1, n1, n1, n4, n1, n1, n1, n1, n1, n1, n1, n1, n4, n1, n1,
			n1, n1, n1, n1, n1, n1, n4, n1, n1, n1, n1, n1, n1, n1, n1, n4, n1,
			n1, n1, n1, n1, n1, n1, n1, n4, n1, n1, n1, n1, n1, n1, n1, n1, n4,
			n1, n1, n1, n1, n1, n1, n1, n1, n4, n1, n1, n1, n1, n1, n1, n1, n1,
			n4, n1, n1, n1, n1, n1, n1, n1, n1, n4, n1, n1, n1, n1, n5, n1, n1,
			n1, n6, n1, n1, n1, n7, n1, n3, n1, n3, n8, n3, n1, n3, n1, n1, n1,
			n3, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n3, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n3, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n9, n1, n1, n1, n1, n1, n1,
			n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1, n1,
		},
		yslice_prob = {},
	}
}

aus.schematics.big_giant_tree_fern = {}
for _, schem in ipairs(aus.schematics.big_tree_fern) do
	table.insert(aus.schematics.big_giant_tree_fern, schem)
end
for _, schem in ipairs(aus.schematics.giant_tree_fern) do
	table.insert(aus.schematics.big_giant_tree_fern, schem)
end
