local class = require 'lib/hump/class'
local effex = class{}
local x = 320
local y = 100
--local direction = math.sin(count/200)*360+bulletcount%5*72
local direction = math.sin(count/600)*360*5+(dirmod)
local speed = 1
local hspd = -.1
local vspd = .1
local id = bulletcount
local sprite_index = love.graphics.newImage("sprites/boolet.png")
--local hspd = love.math.random()
--local vspd = love.math.random()

function effex:new()
	dir2hv(direction, speed, id)
end

function effex:update(dt)
	x = x+hspd*dt
	y = y+vspd*dt
	--print(x, y)
	if math.abs(x-ecks)<=4 and math.abs(y-whai)<=4 then
		bulletcount = 0
		bullets = {}
	end
end

function effex:draw(dt)
	--love.graphics.print("YO", x, y)
	love.graphics.draw(sprite_index, x, y, (direction-90)*.0175, 1, 1, 16, 16, 0, 0)
end

function boolnum(value)
  return value and 1 or 0
end


function dir2hv(angle, spd, id)
	hspd = math.cos(angle*.0175)*spd;
	vspd = math.sin(angle*.0175)*spd;
end

return effex