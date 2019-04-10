local anim_speed = 0.25

function add_mushroom_cloud_effect(effect)
    table.insert(effect, 2, {
                            type = "create-entity",
                            entity_name = "uranium-explosion-LUQ",
                            trigger_created_entity = "true"                
                        })
    table.insert(effect, 3, {
                            type = "create-entity",
                            entity_name = "uranium-explosion-RUQ"
                        })
    table.insert(effect, 4, {
                            type = "create-entity",
                            entity_name = "uranium-explosion-LLQ"
                        })
    table.insert(effect, 5, {
                            type = "create-entity",
                            entity_name = "uranium-explosion-RLQ"
                        })
    table.insert(effect, 6, {
                            type = "create-entity",
                            entity_name = "nuclear-scorchmark",
                            check_buildability = true
                        })
	table.insert(effect, 7, {
							type = "create-entity",
							entity_name = "radiation-cloud"
                        })
end

function remove_vanilla_effect(effect)
    local effect_already_removed = true
    for i=1, #effect, 1 do
        if effect[i]["type"] == "create-entity" and effect[i]["entity_name"] ~= nil and effect[i]["entity_name"] == "small-scorchmark" then
            effect_already_removed = false
        end
    end
    if not effect_already_removed then
        local index = 0
        for i=1, #effect, 1 do
            if effect[i]["type"] == "create-entity" and effect[i]["entity_name"] ~= nil and effect[i]["entity_name"] == "small-scorchmark" then
                index = i
            end
        end
        if index > 0 then
            table.remove(effect, index)               
        end
    end    
end

data:extend({
	{
		type = "explosion",
		name = "uranium-explosion-LUQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__MushroomCloud__/graphics/explosion/LUQ.png",
				priority = "extra-high",
				width = 256,
				height = 256,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {-16, -16},
				animation_speed = anim_speed
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = false
			},
			variations =
			{
				{
					filename = "__MushroomCloud__/sound/nuclear_detonation_in_vincinity_1.ogg", -- only audible up to 40 tiles
					volume = 0.5
				},
			}
		},
	},
	{
		type = "explosion",
		name = "uranium-explosion-RUQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__MushroomCloud__/graphics/explosion/RUQ.png",
				priority = "extra-high",
				width = 256,
				height = 256,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {16, -16},
				animation_speed = anim_speed
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = false
			},
			variations =
			{
				{
					filename = "__MushroomCloud__/sound/nuclear_detonation_in_vincinity_1.ogg",
					volume = 0.5
				},
			}
		},
	},
	{
		type = "explosion",
		name = "uranium-explosion-LLQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__MushroomCloud__/graphics/explosion/LLQ.png",
				priority = "extra-high",
				width = 256,
				height = 256,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {-16, 16},
				animation_speed = anim_speed
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = false
			},
			variations =
			{	
				{
					filename = "__MushroomCloud__/sound/nuclear_detonation_in_vincinity_1.ogg",
					volume = 0.5,
				},
			}
		},
	},
	{
		type = "explosion",
		name = "uranium-explosion-RLQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__MushroomCloud__/graphics/explosion/RLQ.png",
				priority = "extra-high",
				width = 256,
				height = 256,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {16, 16},
				animation_speed = anim_speed
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = false
			},
			variations =
			{
				{
					filename = "__MushroomCloud__/sound/nuclear_detonation_in_vincinity_1.ogg",
					volume = 0.5
				},
			}
		},
	}
})

local projectiles = 
{
    data.raw["projectile"]["atomic-rocket"],
    data.raw["projectile"]["thermonuclear-rocket"],
    data.raw["artillery-projectile"]["atomic-artillery-projectile"],
    data.raw["artillery-projectile"]["nuclear-artillery-projectile"],
    data.raw["artillery-projectile"]["plutonium-artillery-projectile"],
	data.raw["artillery-projectile"]["artillery-projectile-nuclear"],
	data.raw["artillery-projectile"]["artillery-projectile-thermonuclear"]
}

for k,i in pairs(projectiles) do
    if i ~= nil then
        add_mushroom_cloud_effect(i.action.action_delivery.target_effects)
        remove_vanilla_effect(i.action.action_delivery.target_effects)
    end
end
if data.raw["land-mine"]["nuclear-landmine"] ~= nil then
    add_mushroom_cloud_effect(data.raw["land-mine"]["nuclear-landmine"].action.action_delivery.source_effects)
    remove_vanilla_effect(data.raw["land-mine"]["nuclear-landmine"].action.action_delivery.source_effects)
end