local class = require 'lib/hump/class'
asswipe = class{}
local x = 320
local y = 400
local hspd = 0
local vspd = 0
local hput = 0
local vput = 0
local speedscale = 1
local sprite_index = love.graphics.newImage("sprites/me.png")
local thing = love.graphics.newImage("sprites/orb.png")
local turnside = 0;
local closeside = 0;
local count = 0;
function asswipe:new()
end

function asswipe:update()
    hput = boolnum(love.keyboard.isDown("right")) - boolnum(love.keyboard.isDown("left"))
	vput = boolnum(love.keyboard.isDown("down")) - boolnum(love.keyboard.isDown("up"))
	hspd = hput
	vspd = vput
	x = x+hspd*speedscale
	y = y+vspd*speedscale
	if love.keyboard.isDown("lshift") then
		speedscale = 1
	else
		speedscale = 3
		turnside = turnside+hput/5
		closeside = closeside-vput/8
		turnside = clamp(turnside, -6, 6)
		closeside = clamp(closeside, -3, .7)
		if hput == 0 then
			turnside = turnside/1.05
		end
		if vput == 0 then
			closeside = closeside/1.05
		end
	end
	if love.keyboard.isDown("z") and count%8 == 0 then
		makeshot(x, y, 0, -12)
		makeshot(x-10+turnside*2, y+10-closeside*2, (turnside+closeside)*2-1, -12)
		makeshot(x+10+turnside*2, y+10-closeside*2, (turnside-closeside)*2+1, -12)
	end
	x = clamp(x, 0, winwidth)
	y = clamp(y, 0, winheight)
	ecks = x
	whai = y
	count = count+1
	--print(x, y)
end

function asswipe:draw()
	--love.graphics.print("LOL", x, y)
	love.graphics.draw(thing, x, y, 0, 1, 1, 10, 10, 0, 0)
	love.graphics.draw(thing, x-10+turnside*2, y+10-closeside*2, 0, 1, 1, 10, 10, 0, 0)
	love.graphics.draw(thing, x+10+turnside*2, y+10-closeside*2, 0, 1, 1, 10, 10, 0, 0)
	love.graphics.draw(sprite_index, x, y, 0, 1, 1, 16, 16, 0, 0)
end

return asswipe