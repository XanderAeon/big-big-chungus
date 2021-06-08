local class = require 'lib/hump/class'
pattern = class{}
local count = 0;

function pattern:new()
end

function pattern:update()
	makebul(320, 100, math.sin(count/50)*360+count%40, 2)
	makebul(320, 100, math.sin(count/50)*360+count%40+90, 2)
	makebul(320, 100, math.sin(count/50)*360+count%40+180, 2)
	makebul(320, 100, math.sin(count/50)*360+count%40+270, 2)
	count = count+1
end

function pattern:draw(dt)
	love.graphics.print("Enigmatic Boundary", 0, 0)
end

return pattern