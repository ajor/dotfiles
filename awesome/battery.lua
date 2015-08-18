local awful = require("awful")
local wibox = require("wibox")

-- {{{ Battery
mybattery = wibox.widget.textbox()

function battery(widget)
  local percent_text
  local fd = io.open("/sys/class/power_supply/BAT0/energy_now", "rb")
  if fd ~= nil then
    local energy_now = fd:read("*all")
    fd:close()
    fd = io.open("/sys/class/power_supply/BAT0/energy_full", "rb")
    local energy_full = fd:read("*all")
    fd:close()

    local percent = energy_now / energy_full * 100
    percent_text = " " .. math.floor(percent) .. "%"

    if percent < 10 then
      percent_text = "<span color='red'>" .. percent_text .. "</span>"
    end
  else
    percent_text = " No battery"
  end

  widget:set_markup(percent_text)
end

battery(mybattery)

local mytimer = timer({ timeout = 10 })
mytimer:connect_signal("timeout", function() battery(mybattery) end)
mytimer:start()
