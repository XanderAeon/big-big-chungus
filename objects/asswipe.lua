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
	end
	ecks = x
	whai = y
	--print(x, y)
end

function asswipe:draw(dt)
	--love.graphics.print("LOL", x, y)
	love.graphics.draw(sprite_index, x, y, 0, 1, 1, 16, 16, 0, 0)
end

function boolnum(value)
  return value and 1 or 0
end

return asswipe