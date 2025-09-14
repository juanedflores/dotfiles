local _store = {}
local obj = {}
setmetatable(obj, {
  __index = function(_, k)
    return _store[k]
  end,
  __newindex = function(t, k, v)
    rawset(_store, k, v)
    if t._init_done then
      if t._attribs[k] then
        t:init()
      end
    end
  end,
})
obj.__index = obj

-- Metadata
obj.name = 'BlackMenu'
obj.version = '1.0'
obj.author = 'juanedflores <juanedflores@gmail.com>'
obj.homepage = 'https://github.com/juanedflores/my_spoons'
obj.license = 'MIT - https://opensource.org/licenses/MIT'

local logger = hs.logger.new('BlackMenu')
obj.logger = logger

-- Defaults
obj._attribs = {}

for k, v in pairs(obj._attribs) do
  obj[k] = v
end

--- TaskWarrior:init()
--- Method
--- init.
---
--- Parameters:
---  * None
---
--- Returns:
---  * The TaskWarrior object
function obj:init()
  if not self.canvas then
    self.canvas = hs.canvas.new({ x = 0, y = 0, w = 0, h = 0 })
  end

  self.canvas[1] =
    { type = 'rectangle', fillColor = { hex = '#000000', alpha = 1.0 }, strokeColor = { hex = '#000000', alpha = 1.0 } }
  self.canvas:level(hs.canvas.windowLevels.desktopIcon)

  local mainScreen = hs.screen.primaryScreen()
  local mainRes = mainScreen:fullFrame()
  self.canvas:frame({
    x = 0,
    y = 0,
    w = mainRes.w,
    h = 40,
  })
  self._init_done = true
  return self
end

--- AClock:show()
--- Method
--- Show TaskWarrior
---
--- Parameters:
---  * None
---
--- Returns:
---  * The TaskWarrior object
function obj:show()
  self.canvas:show()
  return self
end

return obj
