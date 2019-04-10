script.on_init(function() onInit() end)

-- check mod state
script.on_configuration_changed(function(data)
    -- midgame installation
    if data.mod_changes ~= nil and data.mod_changes["MushroomCloud"] ~= nil and data.mod_changes["MushroomCloud"].old_version == nil then
        -- anounce installation
        notification({"mushroom-cloud-notification-midgame-update", {"mushroom-cloud-prefix"}, data.mod_changes["MushroomCloud"].new_version})

    -- midgame update
    elseif data.mod_changes ~= nil and data.mod_changes["MushroomCloud"] ~= nil and data.mod_changes["MushroomCloud"].old_version ~= nil then
        local oldver = data.mod_changes["MushroomCloud"].old_version
        local newver = data.mod_changes["MushroomCloud"].new_version
        notification({"mushroom-cloud-notification-new-version", {"mushroom-cloud-prefix"}, oldver, newver})
    end
    onInit()
end)

function notification(txt, force)
    if force ~= nil then
        force.print(txt)
    else
        for k, p in pairs (game.players) do
            game.players[k].print(txt)
        end
    end
end

function onInit()
    global.shockwave_approaching = global.shockwave_approaching or false
    global.shockwave_impact_tick = global.shockwave_impact_tick or {}
    -- WIP
end

function dist_a_b(PositionA, PositionB)
    return math.sqrt((PositionB.x - PositionA.x)^2+(PositionB.y-PositionA.y)^2) 
end

function shockwaveTravelTimeInTicks(distance)
    return (distance*60)/330
    -- WIP
end

script.on_event(defines.events.on_trigger_created_entity, function(event)
    local ent = event.entity
    if settings.global["mushroom-cloud-play-sounds"].value and ent.name == "uranium-explosion-LUQ" then -- this is the left upper quarter of the explosion graphics
        local dist = 0
        
        for i, player in pairs(game.connected_players) do
            dist = dist_a_b(player.position, ent.position)
            if dist < settings.global["mushroom-cloud-radius-1"].value then
				player.play_sound{path = "nuclear-detonation-close-proximity"}
                --player.surface.create_entity({name = "nuclear-detonation-close-proximity", position = player.position})
            elseif dist < settings.global["mushroom-cloud-radius-2"].value then
				player.play_sound{path = "nuclear-detonation-in-vincinity"}
                --player.surface.create_entity({name = "nuclear-detonation-in-vincinity", position = player.position})
            elseif dist < settings.global["mushroom-cloud-radius-3"].value*1000 then
				player.play_sound{path = "nuclear-detonation-distant-boom"}
                --player.surface.create_entity({name = "nuclear-detonation-distant-boom", position = player.position})
            elseif dist < settings.global["mushroom-cloud-radius-4"].value*1000 then
				player.play_sound{path = "nuclear-detonation-far-away"}
                --player.surface.create_entity({name = "nuclear-detonation-far-away", position = player.position})
            end
			if dist < 70 then
				player.play_sound{path = "nuclear-detonation-radiation-ticking"}
			end
        end
    end
end)

--script.on_event(defines.events.on_tick, function(event)
--end)