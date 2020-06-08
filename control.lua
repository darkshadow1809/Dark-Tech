require 'config'
require 'util'

script.on_init(
  function()
    On_Init()
  end
)
script.on_configuration_changed(
  function()
    On_Init()
  end
)

function On_Init()
  global.ticks = global.ticks or {}
  for i, force in pairs(game.forces) do
    global.ticks[force.name] = game.tick + minTicksBetweenAlerts
  end
end

script.on_event(
  defines.events.on_forces_merging,
  function(event)
    if global.ticks[event.source.name] then
      global.ticks[event.source.name] = nil
    end
  end
)

function playSoundForForce(sound, force)
  if #force.players == 0 then
    return
  end
  for i, player in pairs(force.players) do
    if player.connected then
      player.surface.create_entity({name = sound, position = player.position})
    end
  end
end

script.on_event(
  defines.events.on_entity_died,
  function(event)
    local current_tick = event.tick
    local entityType = event.entity.type
    if structureDestroyedAlert then
      playSoundForForce('structure-destroyed', event.entity.force)
      global.ticks[event.entity.force.name] = current_tick + minTicksBetweenAlerts
    end
  end
)
