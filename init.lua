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
local function add_rightclick(color)
	minetest.override_item("dye:"..color, {
		on_place = function(itemstack, placer, pointed_thing)
			local nodename = minetest.get_node(pointed_thing.under).name
			minetest.chat_send_all(minetest.get_node(pointed_thing.under).name)
			if minetest.registered_nodes[nodename].groups.wool and minetest.registered_nodes[nodename].groups.wool > 0 then
				minetest.set_node(pointed_thing.under, {name = "wool:"..color})
			end
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end
	})
end

for i = 1, #colors do
	add_rightclick(colors[i])
end
