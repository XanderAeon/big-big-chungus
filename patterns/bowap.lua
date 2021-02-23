local class = require 'lib/hump/class'
pattern = class{}
--bullets[bulletcount] = assert(love.filesystem.load("objects/bullet.lua"))()
dirmod = 0

function pattern:new()
end

function pattern:update(dt)
	for i=0, 5, 1 do
		bullets[bulletcount] = assert(love.filesystem.load("objects/bullet.lua"))()
		dirmod = dirmod+72
	end
	dirmod = 0
end

function pattern:draw(dt)
	love.graphics.print("Border of Wave and Particle", 0, 0)
end