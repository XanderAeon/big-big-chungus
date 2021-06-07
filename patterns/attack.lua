local class = require 'lib/hump/class'
pattern = class{}
--bullets[bulletcount] = assert(love.filesystem.load("objects/bullet.lua"))()

function pattern:new()
end

function pattern:update(dt)
	bullets[bulletcount] = assert(love.filesystem.load("objects/bullet.lua"))()
	bullets[bulletcount].speed = 5
	bullets[bulletcount]:new()
	--bullets[bulletcount].money = "dolla"
	--print(bullets[bulletcount].money)
	--b_direction = b_direction+72
end

function pattern:draw(dt)
	love.graphics.print("Enigmatic Boundary", 0, 0)
end

return pattern