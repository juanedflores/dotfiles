local PrintNotifier = {}

PrintNotifier.new = function(timer, opts)
  local self = setmetatable({}, { __index = PrintNotifier })
  self.timer = timer
  self.hidden = false
  self.opts = opts -- not used
  self.id = 1
  return self
end

PrintNotifier.start = function(self)
  print(string.format('Starting timer for %ds', self.timer.time_limit))
  vim.cmd('lua require("taskwarrior_nvim").browser({"ready"})')
  -- print(task.uuid)
  -- print(id)
  -- vim.o.shell = '/bin/zsh -i'
end

PrintNotifier.tick = function(self, time_left)
  -- if not self.hidden then
  --   print(string.format('Timer #%d, %s, %ds remaining...', self.timer.id, self.timer.name, time_left))
  -- end
end

PrintNotifier.done = function(self)
  vim.cmd('CellularAutomaton make_it_rain')
  -- vim.cmd("call timer_start(2000, { tid -> execute('call DailyDiaryToggle()')})")
  -- vim.cmd('call DailyDiaryToggle()')
  -- local id = vim.fn.system("task active rc.verbose=nothing limit:1 | cut -f1 -d' '")
  vim.cmd('Task +ACTIVE stop')
end

PrintNotifier.stop = function(self) end

PrintNotifier.show = function(self)
  self.hidden = false
end

PrintNotifier.hide = function(self)
  self.hidden = true
end

require('pomo').setup({

  -- How often the notifiers are updated.
  update_interval = 1000,

  -- Configure the default notifiers to use for each timer.
  -- You can also configure different notifiers for timers given specific names, see
  -- the 'timers' field below.
  notifiers = {
    -- {
    --   name = 'Default',
    --   opts = {
    --     sticky = true,
    --     title_icon = '󱎫',
    --     text_icon = '󰄉',
    --   },
    -- },
    {
      init = PrintNotifier.new,
      opts = {
        sticky = false,
        title_icon = '󱎫',
        text_icon = '󰄉',
      },
    },

    -- { name = 'System' },

    -- You can also define custom notifiers by providing an "init" function instead of a name.
    -- See "Defining custom notifiers" below for an example 👇
    -- { init = function(timer) ... end }
  },

  -- Override the notifiers for specific timer names.
  timers = {
    -- For example, use only the "System" notifier when you create a timer called "Break",
    -- e.g. ':TimerStart 2m Break'.
    Break = {
      { name = 'System' },
    },
  },
})
