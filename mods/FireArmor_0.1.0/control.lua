--control.lua

script.on_event({defines.events.on_tick},
   function (e)
      if e.tick % 30 == 0 then 
         for index,player in pairs(game.connected_players) do  
            
            if player.character and player.get_inventory(defines.inventory.player_armor).get_item_count("fire-armor") >= 1 then
               player.surface.create_entity{name="fire-flame", position=player.position, force="neutral"} 
            end
         end
      end
   end
)
