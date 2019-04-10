projectile = {
    ["atomic-bomb-wave"] = {
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
                amount = 400,
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
      name = "atomic-bomb-wave",
      shadow = {
        filename = "__core__/graphics/empty.png",
        frame_count = 1,
        height = 1,
        priority = "high",
        width = 1
      },
      type = "projectile"
    },
    ["atomic-rocket"] = {
      acceleration = 0.005,
      action = {
        action_delivery = {
          target_effects = {
            {
              offset_deviation = {
                {
                  -1,
                  -1
                },
                {
                  1,
                  1
                }
              },
              repeat_count = 100,
              smoke_name = "nuclear-smoke",
              speed_from_center = 0.5,
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
                  projectile = "atomic-bomb-wave",
                  starting_speed = 0.5,
                  type = "projectile"
                },
                radius = 35,
                repeat_count = 2000,
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
      name = "atomic-rocket",
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
    },