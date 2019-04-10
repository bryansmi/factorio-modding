--item.lua
--wave
local littleBoyWave= table.deepcopy(data.raw.projectile["atomic-bomb-wave"])
littleBoyWave = {
    acceleration = 0,
    action = {
      {
        action_delivery = {
          target_effects = {
            {
              entity_name = "explosion",
              type = "create-entity"
            }
          },
          type = "instant"
        },
        type = "direct"
      },
      {
        action_delivery = {
          target_effects = {
            damage = {
              amount = 75,
              type = "explosion"
            },
            type = "damage"
          },
          type = "instant"
        },
        radius = 3,
        type = "area"
      }
    },
    animation = {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      height = 1,
      priority = "high",
      width = 1
    },
    flags = {
      "not-on-map"
    },
    name = "little-boy-wave",
    shadow = {
      filename = "__core__/graphics/empty.png",
      frame_count = 1,
      height = 1,
      priority = "high",
      width = 1
    },
    type = "projectile"
}

data:extend{littleBoyWave}

--rocket
local littleBoyRocket = table.deepcopy(data.raw.projectile["atomic-rocket"])

littleBoyRocket = {
    acceleration = 0.015,
    action = {
        action_delivery = {
            target_effects = {
                {
                    offset_deviation = {
                        { -5, -5 },
                        { 5, 5 }
                    },
                    -- repeat_count = wave.repeat_count / 20
                    repeat_count = 5000,
                    smoke_name = "nuclear-smoke",
                    speed_from_center = 5.5,
                    starting_frame = 3,
                    starting_frame_deviation = 5,
                    starting_frame_speed = 0,
                    starting_frame_speed_deviation = 5,
                    type = "create-trivial-smoke"
                },
                {
                    entity_name = "explosion",
                    type = "create-entity"
                },
                {
                    damage = {
                        amount = 400,
                        type = "explosion"
                    },
                    type = "damage"
                },
                {
                    check_buildability = true,
                    entity_name = "small-scorchmark",
                    type = "create-entity"
                },
                {
                    action = {
                        action_delivery = {
                            projectile = "little-boy-wave",
                            -- 5.5*60hz = 330 m/s (speed of sound 343 m/s)
                            starting_speed = 5.5,
                            type = "projectile"
                        },
                        -- little boy actual radius = 1.5km
                        -- little boy scale: 1:2
                        radius = 750,
                        -- repeat_count = radius * 133.33
                        repeat_count = 100000,
                        target_entities = false,
                        trigger_from_target = true,
                        type = "area"
                    },
                    type = "nested-result"
                }
            },
            type = "instant"
        },
        type = "direct"
    },
    animation = {
        filename = "__base__/graphics/entity/rocket/rocket.png",
        frame_count = 8,
        height = 35,
        line_length = 8,
        priority = "high",
        shift = {
            0,
            0
        },
        width = 9
    },
    flags = {
        "not-on-map"
    },
    light = {
        intensity = 0.8,
        size = 15
    },
    name = "little-boy-rocket",
    shadow = {
        filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
        frame_count = 1,
        height = 24,
        priority = "high",
        shift = {
            0,
            0
        },
        width = 7
    },
    smoke = {
        {
            deviation = {
                0.15,
                0.15
            },
            frequency = 1,
            name = "smoke-fast",
            position = {
                0,
                -1
            },
            slow_down_factor = 1,
            starting_frame = 3,
            starting_frame_deviation = 5,
            starting_frame_speed = 0,
            starting_frame_speed_deviation = 5
        }
    },
    type = "projectile"
}

data:extend{littleBoyRocket}

--bomb
local littleBoy = table.deepcopy(data.raw.ammo["atomic-bomb"])

littleBoy.name = "little-boy"
littleBoy.icons = {
    {
        icon=littleBoy.icon,
        tint={r=0.5,g=0.5,b=0.5,a=1.0}
    }
}

littleBoy.ammo_type.action.action_delivery.projectile = "little-boy-rocket"
littleBoy.order = "d[rocket-launcher]-c[little-boy]"

--bomb.recipe
local recipe = table.deepcopy(data.raw.recipe["atomic-bomb"])
recipe.enabled = true
recipe.name = "little-boy"
recipe.result = "little-boy"

data:extend{littleBoy,recipe}
