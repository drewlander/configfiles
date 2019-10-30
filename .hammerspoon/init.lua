require 'switchspaces'
local sizeup = { }
--- Multiple Monitor Actions ---
-- Send Window Prev Monitor
hs.hotkey.bind({ "ctrl", "alt" }, "Left", function()
    sizeup.send_window_prev_monitor()
  end)
  -- Send Window Next Monitor
  hs.hotkey.bind({ "ctrl", "alt" }, "Right", function()
    sizeup.send_window_next_monitor()
  end)

  -- Margins --
sizeup.screen_edge_margins = {
    top =    0, -- px
    left =   0,
    right =  0,
    bottom = 0
  }
  sizeup.partition_margins = {
    x = 0, -- px
    y = 0
  }
  
  -- Partitions --
  sizeup.split_screen_partitions = {
    x = 0.5, -- %
    y = 0.5
  }
  sizeup.quarter_screen_partitions = {
    x = 0.5, -- %
    y = 0.5
  }
  

  function sizeup.send_window_prev_monitor()
    local win = hs.window.focusedWindow()
    local nextScreen = win:screen():previous()
    win:moveToScreen(nextScreen)
  end
  
  function sizeup.send_window_next_monitor()
    local win = hs.window.focusedWindow()
    local nextScreen = win:screen():next()
    win:moveToScreen(nextScreen)
  end