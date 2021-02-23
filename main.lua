class = require 'lib/hump/class'
--from https://github.com/vrld/hump

asswipe = require 'objects/asswipe'
bullets = {}
bulletcount = 0
count = 0
dirmod = 0
ecks = 0
whai = 0
love.window.setTitle("Omnidirectional")


--danmathu = require 'scripts/dir2hv'


function love.load()
	love.window.setMode(640, 480)
	understale = 0
end

function love.update(dt)
	dt = love.timer.getDelta()*200
	asswipe:update(dt)
	bowap()
	
	if bulletcount >= 1000 then
		bulletcount = 0
	end
	for i=0, count, 1 do
		if i < #bullets then
			bullets[i]:update(dt)
		end
	end
	
	count = count+dt
	
end

function love.draw()
	love.graphics.print(math.floor(understale), 320, 240)
	asswipe:draw()
	for i=0, count, 1 do
		if i < #bullets then
			bullets[i]:draw()
		end
	end
end

function bowap()
	--for i=0, 5, 1 do
		bullets[bulletcount] = assert(love.filesystem.load("objects/bullet.lua"))()
		bullets[bulletcount]:new()
		bulletcount = bulletcount+1
		dirmod = dirmod+72
	--end
	--dirmod = 0

end