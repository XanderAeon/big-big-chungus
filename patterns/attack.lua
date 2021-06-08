local class = require 'lib/hump/class'
pattern = class{}
--bullets[bulletcount] = assert(love.filesystem.load("objects/bullet.lua"))()

function pattern:new()
end

function pattern:update(dt)
	global:bulletmake(320, 100, 225, 2)
	--bullets[bulletcount].money = "dolla"
	--print(bullets[bulletcount].money)
	--b_direction = b_direction+72
end

function pattern:draw(dt)
	love.graphics.print("Enigmatic Boundary", 0, 0)
end

return pattern