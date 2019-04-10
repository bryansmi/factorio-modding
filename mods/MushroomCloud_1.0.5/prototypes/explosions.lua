data:extend({
    {
		type = "sound",
		name = "nuclear-detonation-close-proximity",
		filename = "__MushroomCloud__/sound/nuclear_detonation_close_proximity.ogg",
		volume = 2.0
	},
    {
		type = "sound",
		name = "nuclear-detonation-in-vincinity",
		variations = {
			{
				filename = "__MushroomCloud__/sound/nuclear_detonation_in_vincinity_1.ogg",
				volume = 1.50
			},
			{
                filename = "__MushroomCloud__/sound/nuclear_detonation_in_vincinity_2.ogg",
                volume = 1.75
            }
		}
	},
	{
		type = "sound",
		name = "nuclear-detonation-distant-boom",
		variations = {
            {
                filename = "__MushroomCloud__/sound/nuclear_explosion_distant_boom_1.ogg",
                volume = 1.75
            },
            {
                filename = "__MushroomCloud__/sound/nuclear_explosion_distant_boom_2.ogg",
                volume = 1.6
            },
            {
                filename = "__MushroomCloud__/sound/nuclear_explosion_distant_boom_3.ogg",
                volume = 1.75
            }   
		}
	},
    {
		type = "sound",
		name = "nuclear-detonation-far-away",
		filename = "__MushroomCloud__/sound/nuclear_detonation_far_away.ogg",
		volume = 2.0
	},	--[[
	{
		type = "explosion",
		name = "nuclear-detonation-in-vincinity",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__MushroomCloud__/graphics/dummy.png",
				priority = "low",
				width = 32,
				height = 32,
				frame_count = 1,
				line_length = 1,
				animation_speed = 1
			},
		},
		light = {intensity = 0, size = 0},
		sound =
		{
            {
                filename = "__MushroomCloud__/sound/nuclear_detonation_in_vincinity_1.ogg",
                volume = 1.25,
                audible_distance_modifier = 0.3
            },
            {
                filename = "__MushroomCloud__/sound/nuclear_detonation_in_vincinity_2.ogg",
                volume = 1.25,
                audible_distance_modifier = 0.3
            },            
		},
	},
	{
		type = "explosion",
		name = "nuclear-detonation-close-proximity",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__MushroomCloud__/graphics/dummy.png",
				priority = "low",
				width = 32,
				height = 32,
				frame_count = 1,
				line_length = 1,
				animation_speed = 1
			},
		},
		light = {intensity = 0, size = 0},
		sound =
		{
            {
                filename = "__MushroomCloud__/sound/nuclear_detonation_close_proximity.ogg",
                volume = 1.25,
                audible_distance_modifier = 0.3
            },
		},
	},
	{
		type = "explosion",
		name = "nuclear-detonation-distant-boom",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__MushroomCloud__/graphics/dummy.png",
				priority = "low",
				width = 32,
				height = 32,
				frame_count = 1,
				line_length = 1,
				animation_speed = 1
			},
		},
		light = {intensity = 0, size = 0},
		sound =
		{
            {
                filename = "__MushroomCloud__/sound/nuclear_explosion_distant_boom_1.ogg",
                volume = 1.25,
                audible_distance_modifier = 0.3
            },
            {
                filename = "__MushroomCloud__/sound/nuclear_explosion_distant_boom_2.ogg",
                volume = 1.3,
                audible_distance_modifier = 0.3
            },
            {
                filename = "__MushroomCloud__/sound/nuclear_explosion_distant_boom_3.ogg",
                volume = 1.35,
                audible_distance_modifier = 0.3
            }   
		},
	},
	{
		type = "explosion",
		name = "nuclear-detonation-far-away",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__MushroomCloud__/graphics/dummy.png",
				priority = "low",
				width = 32,
				height = 32,
				frame_count = 1,
				line_length = 1,
				animation_speed = 1
			},
		},
		light = {intensity = 0, size = 0},
		sound =
		{
            {
                filename = "__MushroomCloud__/sound/nuclear_detonation_far_away.ogg",
                volume = 1.5,
                audible_distance_modifier = 0.3
            },
		},
	},]]
})

local nuclear_crater = util.table.deepcopy(data.raw["corpse"]["small-scorchmark"])

nuclear_crater.name = "nuclear-scorchmark"
nuclear_crater.order = "d[remnants]-b[scorchmark]-b[nuclear]"
nuclear_crater.animation.scale = 8
nuclear_crater.ground_patch.sheet.scale = 8
nuclear_crater.ground_patch_higher.sheet.scale = 8

data:extend({nuclear_crater})