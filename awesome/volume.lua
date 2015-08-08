local awful = require("awful")
local wibox = require("wibox")

-- {{{ Volume
-- Create a volume control widget
myvolume = wibox.widget.textbox()
myvolume:buttons( awful.util.table.join(
    awful.button({ }, 4, function () volume(myvolume, "up") end),
    awful.button({ }, 5, function () volume(myvolume, "down") end),
    awful.button({ }, 1, function () volume(myvolume, "mute") end)
))

function volume(widget, mode)
    if mode == "update" then
        local fd = io.popen("amixer sget Master")
        local status = fd:read("*all")
        fd:close()

        local volume = string.match(status, "(%d?%d?%d)%%")
        local volume_text = string.format("% 3d", volume)

        status = string.match(status, "%[(o[^%]]*)%]")
        if string.find(status, "on", 1, true) then
            volume = volume_text .."%"
        else
            volume = "<span color='red'>".. volume_text .."M</span>"
        end
        widget:set_markup(volume)
    elseif mode == "up" then
        awful.util.spawn("amixer set Master 5%+ unmute")
        volume(widget, "update")
    elseif mode == "down" then
        awful.util.spawn("amixer set Master 5%- unmute")
        volume(widget, "update")
    elseif mode == "mute" then
        awful.util.spawn("amixer set Master toggle")
        volume(widget, "update")
    end
end

volume(myvolume, "update")
