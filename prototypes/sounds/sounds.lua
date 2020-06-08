data:extend(
  {
    {
      type = 'explosion',
      name = 'structure-destroyed',
      flags = {'not-on-map'},
      animations = {
        {
          filename = '__dark-tech__/graphics/null.png',
          priority = 'low',
          width = 32,
          height = 32,
          frame_count = 1,
          line_length = 1,
          animation_speed = 1
        }
      },
      light = {intensity = 0, size = 0},
      sound = {
        {
          filename = '__dark-tech__/prototypes/sounds/' .. voiceStyle .. '/structuredestroyed.ogg',
          volume = 0.75
        }
      }
    }
  }
)
