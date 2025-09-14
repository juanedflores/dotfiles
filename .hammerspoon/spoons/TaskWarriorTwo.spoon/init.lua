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
obj.name = 'TaskWarriorTwo'
obj.version = '1.0'
obj.author = 'juanedflores <juanedflores@gmail.com>'
obj.homepage = 'https://github.com/juanedflores/my_spoons'
obj.license = 'MIT - https://opensource.org/licenses/MIT'

local logger = hs.logger.new('TaskWarrior')
obj.logger = logger

obj.pending_tasks = {}

-- Defaults
obj._attribs = {
  task_name = '',
  total_time = 0.0,
  time_stamp = 0.0,
  elapsed_minutes = 0,
  break_minutes = 0,
  break_hours = 0,
  taskStarted = false,
  elapsed_hours = 0,
  width = 1000,
  height = 400,
  blink_count = 0,
  blink_max = 12,
  voice = nil,
  mainres = 0,
}

front = false
ranY = 0

myWatcher = ''
taskname = ''

textattrbs = {
  font = { name = 'Impact', size = 24 },
  paragraphStyle = { lineHeightMultiple = 1.1, linebreak = clip },
}
blue_col = {
  color = { hex = '#36A3D9' },
}
orange_col = {
  color = { hex = '#FF7733' },
}
green_col = {
  color = { hex = '#BBCC52' },
}
red_col = {
  color = { hex = '#F07178' },
}

rawtext = 'break time'
display_text = hs.styledtext.new(rawtext, textattrbs):setStyle(blue_col, 0, 11)
spaces = 0
spaces_string = ''
task_str_len = 0
started = 0
tickCounter = 0

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
    { type = 'rectangle', fillColor = { hex = '#000000', alpha = 0.0 }, strokeColor = { hex = '#000000', alpha = 0.0 } }
  self.canvas[2] = {
    type = 'text',
    text = display_text,
  }
  self.canvas:level(hs.canvas.windowLevels.desktopIcon)
  self.canvas:bringToFront()

  local mainScreen = hs.screen.primaryScreen()
  local mainRes = mainScreen:fullFrame()
  self.canvas:frame({
    x = 0,
    y = ranY,
    w = mainRes.w,
    h = 40,
  })

  self._init_done = true
  return self
end

function checkTasks2(files, flagTables)
  print('CHANGED')

  function taskCallback(exitCode, stdOut, stdErr)
    if exitCode == 0 then
      print('stdOut: ' .. stdOut)
      result = stdOut

      if result == '[\n]\n' and obj.taskStarted == true then
        -- break time has started after a task completion
        obj.taskStarted = false
        obj.break_minutes = 0
        rawtext = 'break time'
      elseif result == '[\n]\n' and obj.taskStarted == false then
        -- still in break time
        obj.taskStarted = false
        rawtext = 'break time'
      elseif result ~= '[\n]\n' and obj.taskStarted == true then
        i, j = string.find(result, 'description')
        substring = string.sub(result, j + 2)
        res2 = string.match(substring, '%b""')
        taskname = string.gsub(res2, '"', '')
        obj.taskStarted = true
        obj.task_name = taskname

        -- get start time
        i, j = string.find(result, 'start')
        substring = string.sub(result, j + 2)
        res2 = string.match(substring, '%b""')
        s = string.gsub(res2, '"', '')

        y = string.sub(s, 1, 4)
        mo = string.sub(s, 5, 6)
        d = string.sub(s, 7, 8)
        h = string.sub(s, 10, 11) + 1 -- not sure why I have to offset. maybe DST
        mi = string.sub(s, 12, 13)
        se = string.sub(s, 14, 15)

        print('year: ' .. y .. ' month: ' .. mo .. ' day: ' .. d .. ' hour: ' .. h .. ' min: ' .. mi .. ' sec: ' .. se)

        s_timestamp = os.time({ year = y, month = mo, day = d, hour = h, min = mi, sec = se })

        print('START TIME: ' .. s_timestamp)
        print('CURRENT TIME: ' .. os.time(os.date('!*t')))

        -- ti = os.time(os.date('!*t'))
        -- isdst = ti.isdst
        -- print(isdst)
        -- print('CURRENT TIME: ' .. os.time(os.date('*t')))
        -- print('EPOCH' .. os.date('!*t', starttime))
        -- print('CURRENT TIME: ' .. os.date())
        -- print('CURRENT TIME: ' .. os.time())
        -- print('FORMATTED START TIME' .. format(%2d, starttime))
        difftime = os.difftime(os.time(os.date('!*t')), s_timestamp) + 3600
        minutes = math.floor(difftime / 60) % 60
        hours = math.floor(math.floor(difftime / 60) / 60) - 1
        seconds = difftime % 60
        print('DIFF TIME: ' .. os.difftime(os.time(), s_timestamp))
        print('ELAPSED TIME: ' .. hours .. ' hours ' .. minutes .. ' minutes and ' .. seconds .. ' seconds')

        obj.elapsed_minutes = minutes
        obj.elapsed_hours = hours

        time_text = hours .. ' hours ' .. minutes .. ' minutes ' .. seconds .. ' seconds '
        rawtext = 'current task : ' .. taskname .. ' | ' .. time_text
      elseif result ~= '[\n]\n' and obj.taskStarted == false then
        -- get task name
        i, j = string.find(result, 'description')
        substring = string.sub(result, j + 2)
        res2 = string.match(substring, '%b""')
        taskname = string.gsub(res2, '"', '')
        obj.taskStarted = true
        obj.task_name = taskname

        -- get start time
        i, j = string.find(result, 'start')
        substring = string.sub(result, j + 2)
        res2 = string.match(substring, '%b""')
        s = string.gsub(res2, '"', '')

        y = string.sub(s, 1, 4)
        mo = string.sub(s, 5, 6)
        d = string.sub(s, 7, 8)
        h = string.sub(s, 10, 11) + 1 -- not sure why I have to offset. maybe DST
        mi = string.sub(s, 12, 13)
        se = string.sub(s, 14, 15)

        print('year: ' .. y .. ' month: ' .. mo .. ' day: ' .. d .. ' hour: ' .. h .. ' min: ' .. mi .. ' sec: ' .. se)

        s_timestamp = os.time({ year = y, month = mo, day = d, hour = h, min = mi, sec = se })

        print('START TIME: ' .. s_timestamp)
        print('CURRENT TIME: ' .. os.time(os.date('!*t')))

        -- ti = os.time(os.date('!*t'))
        -- isdst = ti.isdst
        -- print(isdst)
        -- print('CURRENT TIME: ' .. os.time(os.date('*t')))
        -- print('EPOCH' .. os.date('!*t', starttime))
        -- print('CURRENT TIME: ' .. os.date())
        -- print('CURRENT TIME: ' .. os.time())
        -- print('FORMATTED START TIME' .. format(%2d, starttime))
        difftime = os.difftime(os.time(os.date('!*t')), s_timestamp) + 3600
        minutes = math.floor(difftime / 60) % 60
        hours = math.floor(math.floor(difftime / 60) / 60) - 1
        seconds = difftime % 60
        print('DIFF TIME: ' .. os.difftime(os.time(), s_timestamp))
        print('ELAPSED TIME: ' .. hours .. ' hours ' .. minutes .. ' minutes and ' .. seconds .. ' seconds')

        obj.elapsed_minutes = minutes
        obj.elapsed_hours = hours

        time_text = hours .. ' hours ' .. minutes .. ' minutes ' .. seconds .. ' seconds '
        rawtext = 'current task : ' .. taskname .. ' | ' .. time_text

        spaces = 0
      end

      print('END OF TASK')
    else
      print('ERROR')
      print(stdErr)
    end
  end

  if obj.total_time > obj.time_stamp + 2 then
    print('TRUEEEEEEEEe')
    obj.time_stamp = obj.total_time
    local myTask = hs.task.new('/opt/homebrew/bin/task', taskCallback, { 'export', 'active' })
    myTask:start()

    -- myTask:waitUntilExit()
  else
    print('BLOCKED BITCH')
  end
end

function obj:tick_timer_animate()
  return hs.timer.doEvery(0.3, function()
    obj.total_time = obj.total_time + 0.3
    spaces = spaces + 1
    spaces_string = ''

    for i = 0, spaces do
      spaces_string = spaces_string .. ' '
    end
    totalstring = spaces_string .. rawtext
    -- hard coded number of spaces to restart text animation from left side

    local mainScreen = hs.screen.primaryScreen()
    local mainRes = mainScreen:fullFrame()
    if spaces == 550 and obj.total_time > obj.time_stamp + 1 then
      ranY = math.random(0, mainRes.h)
      print('ranY: ' .. ranY)
      if front == false then
        front = true
        obj.canvas:bringToFront()
      end
    end
    if spaces == 600 then
      spaces = 0
    end
    if taskname == nil or not self.taskStarted then
      rawtext = 'break time. ' .. 'elapsed time: ' .. obj.break_hours .. ' and ' .. obj.break_minutes .. ' minutes'
      display_text = display_text:setString(spaces_string .. rawtext):setStyle(blue_col, 0, spaces + 11)
    else
      display_text = display_text
        :setString(spaces_string .. rawtext)
        :setStyle(green_col, 0, spaces + 16)
        :setStyle(orange_col, spaces + 16, spaces + 16 + string.len(obj.task_name))
        :setStyle(red_col, spaces + 16 + string.len(obj.task_name) + 4, spaces + 16 + string.len(obj.task_name) + 50)
    end

    self.canvas[2].text = display_text

    -- update the text every 20 ticks
    if spaces % 20 == 0 then
      local myTask = hs.task.new('/opt/homebrew/bin/task', function()
        print('updated the text after 20 ticks')
      end, { 'list' })
      myTask:start()
    end
  end)
end

function obj:tick_timer_fn()
  return hs.timer.doEvery(60, function()
    self.break_minutes = self.break_minutes + 1

    local myTask = hs.task.new('/opt/homebrew/bin/task', taskCallback, { 'status:pending', 'count' })
    --
    function taskCallback(exitCode, stdOut, stdErr)
      if exitCode == 0 then
        print('EXIT CODEEEEEEEEEEEEEEEEEEEEEeee')
        hs.alert.show('There are ' .. string.gsub(stdOut, '%D', '') .. ' Tasks Pending')
      else
        hs.alert.show('Task failed with exit code: ' .. exitCode)
        hs.alert.show('Error: ' .. stdErr)
      end
    end

    if self.break_minutes % 2 == 0 and self.taskStarted == false then
      myTask:start()
      self.canvas[1] = { type = 'rectangle', fillColor = { hex = '#d78700', alpha = 1.0 } }
    end

    if self.break_minutes == 60 then
      self.break_hours = self.break_hours + 1
      self.break_minutes = 0
    end

    if self.taskStarted then
      time_text = self.elapsed_hours .. ' hours ' .. self.elapsed_minutes .. ' minutes '
      styledText =
        hs.styledtext.new('current task: ' .. self.task_name .. ' | ' .. ' elapsed time:  ' .. time_text, textattrbs)
      rawtext = styledText:getString()
    else
      rawtext = 'break time. ' .. 'elapsed time: ' .. self.break_hours .. ' and ' .. self.break_minutes .. ' minutes'
    end
  end)
end

--- TaskWarriorTwo:show()
--- Method
--- Show TaskWarrior
---
--- Parameters:
---  * None
---
--- Returns:
---  * The TaskWarriorTwo object
function obj:show()
  -- show the canvas
  self.canvas:show()
  self.tick_timer = self:tick_timer_fn()
  -- timer for animating the canvas every 0.3 seconds
  self.animate_timer = self:tick_timer_animate()

  myWatcher = hs.pathwatcher.new(os.getenv('HOME') .. '/.task/taskchampion.sqlite3', checkTasks2):start()

  return self
end

return obj
