data:extend({
{
    type = "smoke-with-trigger",
    name = "radiation-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
		filename = "__MushroomCloud__/graphics/dummy.png",
		priority = "low",
		width = 32,
		height = 32,
		frame_count = 1,
		line_length = 1,
		animation_speed = 1
    },
    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 120,
    fade_away_duration = 20 * 60,
    spread_duration = 10,
    color = { r = 0.9, g = 0.9, b = 0.9, a = 0.1 },
    action =
    {
		type = "direct",
		action_delivery =
		{
			type = "instant",
			target_effects =
			{ 
				{
					type = "nested-result",
					action =
					{
						type = "area",
						radius = 25, 
						entity_flags = {"breaths-air"},
						action_delivery =
						{
							type = "instant",
							target_effects =
							{	
								type = "damage",
								damage = {amount = 47, type = "poison"}
							},
						}
					}
				},
				{
					type = "nested-result",
					action =
					{
						type = "area",
						radius = 45, 			
						entity_flags = {"breaths-air"},						
						action_delivery =
						{
							type = "instant",
							target_effects =
							{	
								type = "damage",
								damage = {amount = 13, type = "poison"}
							},
						}			
					}
				},
				{
					type = "nested-result",
					action =
					{
						type = "area",
						radius = 60, 
						action_delivery =
						{
							type = "instant",
							target_effects =
							{	
								type = "damage",
								damage = {amount = 1, type = "poison"}
							},
						}
					}
				},
				--[[{
					type = "create-explosion",
					entity_name = "radiation-sound"
				}, ]]
				{
					type = "play-sound",
					sound = 
					{
						aggregation =
						{
							max_count = 1,
							count_already_playing = true,
							progress_threshold = 1.0,
							remove = true
						},
						variations =
						{
							{
								filename = "__MushroomCloud__/sound/radiation_ticking.ogg",
								volume = 3
							}
						}
					},
				}, 
			}
		}
    }, 
    action_cooldown = 37
},
{
	type = "sound",
	name = "nuclear-detonation-radiation-ticking",
	filename = "__MushroomCloud__/sound/radiation_ticking.ogg",
	volume = 3
}
})