-- Tree fern sapling
minetest.register_node("australia:sapling_tree_fern", {
	description = "Dicksonia Antarctica: Tree Fern Sapling",
	drawtype = "plantlike",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"aus_sapling_tree_fern.png"},
	inventory_image = "aus_sapling_tree_fern.png",
	walkable = false,
	groups = {snappy=3,flammable=2,attached_node=1,sapling=1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})

-- Tree fern leaves
minetest.register_node("australia:tree_fern_leaves", {
	description = "Dicksonia Antarctica: Tree Fern Crown",
	drawtype = "plantlike",
	visual_scale = 2,
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"aus_fern_tree.png"},
	inventory_image = "aus_fern_tree_inv.png",
	walkable = false,
	groups = {snappy=3,flammable=2,attached_node=1,leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {"autralia:sapling_tree_fern 2"},
				rarity = 10,
			},
			{
				items = {"australia:tree_fern_leaves"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})
minetest.register_node("australia:tree_fern_leaves_02", {
	drawtype = "plantlike",
	visual_scale = 2,
	paramtype = "light",
	tiles = {"aus_fern_big.png"},
	walkable = false,
	groups = {snappy=3,flammable=2,attached_node=1,leaves=1,not_in_creative_inventory=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {"australia:sapling_tree_fern 2"},
				rarity = 20,
			},
			{
				items = {"australia:tree_fern_leaves"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7/16, -1/2, -7/16, 7/16, 0, 7/16},
	},
})

-- Fern trunk
minetest.register_node("australia:fern_trunk", {
	description = "Dicksonia Antarctica: Tree Fern Trunk",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"aus_fern_trunk_top.png",
		"aus_fern_trunk_top.png",
		"aus_fern_trunk.png"
	},
	use_texture_alpha = "clip",
	node_box = {
		type = "fixed",
		fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
	after_destruct = function(pos,oldnode)
		local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
		if node.name == "australia:fern_trunk" then
			minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z})
		end
	end,
})

local f1 = { name = "australia:fern_trunk" }
local f2 = { name = "australia:tree_fern_leaves_02" }
aus.schematics.small_tree_fern = {
	{
		size = {y = 4, x = 1, z = 1},
		data = {
			f1, f1, f1, f2,
		},
		yslice_prob = {},
	}
}
