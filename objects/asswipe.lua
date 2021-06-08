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
local turnside = 0;
local closeside = 0;
local count = 0;
function asswipe:new()
end

function asswipe:update(dt)
    hput = boolnum(love.keyboard.isDown("right")) - boolnum(love.keyboard.isDown("left"))
	vput = boolnum(love.keyboard.isDown("down")) - boolnum(love.keyboard.isDown("up"))
	hspd = hput
	vspd = vput
	x = x+hspd*speedscale*dt
	y = y+vspd*speedscale*dt
	if love.keyboard.isDown("lshift") then
		speedscale = .5
	else
		speedscale = 1.5
		turnside = turnside+hput/20
		closeside = closeside-vput/30
		turnside = clamp(turnside, -6, 6)
		closeside = clamp(closeside, -4, .2)
		if hput == 0 then
			turnside = turnside/1.004
		end
		if vput == 0 then
			closeside = closeside/1.004
		end
	end
	if love.keyboard.isDown("z") and count%11 == 0 then
		makebul(x, y, 0, -6)
		makebul(x-10, y+10-closeside*2, turnside+closeside, -6)
		makebul(x+10, y+10+closeside*2, turnside-closeside, -6)
	end
	ecks = x
	whai = y
	count = count+1
	--print(x, y)
end

function asswipe:draw(dt)
	--love.graphics.print("LOL", x, y)
	love.graphics.draw(sprite_index, x, y, 0, 1, 1, 16, 16, 0, 0)
end

return asswipe