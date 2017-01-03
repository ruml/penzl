
local lgi = require 'lgi'
local Gdk = lgi.Gdk
local cairo = lgi.cairo

local _D = {}

function _D:init()
  self.cr = cairo.Context(surface)
end

function _D:color(r,g,b,a)
  self.cr:set_source_rgba(r/255,g/255,b/255,(a or 100)/100)
end

function _D:rectangle(x,y,width,height)
  local rect = Gdk.Rectangle {
    x = x, y = y,
    width = width, height = height
  }
  assert(surface,"Surface is nil")
  self.cr:rectangle(rect)
  self.cr:fill()
  canvas.window:invalidate_rect(rect, false)
end

return _D