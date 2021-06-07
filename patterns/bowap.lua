local class = require 'lib/hump/class'
pattern = class{}
--bullets[bulletcount] = assert(love.filesystem.load("objects/bullet.lua"))()

function pattern:new()
end

function pattern:update(dt)
	bullets[bulletcount] = assert(love.filesystem.load("objects/bullet.lua"))()
	bullets[bulletcount]:new()
	dirmod = dirmod+72
end

function pattern:draw(dt)
	love.graphics.print("Border of Wave and Particle", 0, 0)
end

return pattern