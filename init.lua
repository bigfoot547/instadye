local colors = {"white",
	"grey",
	"dark_grey",
	"black",
	"violet",
	"blue",
	"cyan",
	"dark_green",
	"green",
	"yellow",
	"brown",
	"orange",
	"red",
	"magenta",
	"pink"}
local function register_dye(dye, block, group)
	minetest.override_item(dye, {
		on_use = function(itemstack, user, pointed_thing)
			if pointed_thing.type == "node" and minetest.registered_nodes[minetest.get_node(pointed_thing.under).name].groups[group] then
				local nodename = minetest.get_node(pointed_thing.under).name
				--minetest.chat_send_all(minetest.get_node(pointed_thing.under).name)
				if minetest.registered_nodes[nodename].groups.wool and minetest.registered_nodes[nodename].groups[group] > 0 then
					minetest.set_node(pointed_thing.under, {name = block})
				end
				if not minetest.setting_getbool("creative_mode") then
					itemstack:take_item()
				end
				return itemstack
			else
				return itemstack
			end
		end
	})
end

for i = 1, #colors do
	register_dye("dye:"..colors[i], "wool:"..colors[i], "wool")
end
