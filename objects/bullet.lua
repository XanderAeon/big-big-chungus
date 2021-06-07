local class = require 'lib/hump/class'
local bullet = class{}
local x = 320
local y = 100

local hspd = -.1
local vspd = .1
local id = bulletcount
local sprite_index = love.graphics.newImage("sprites/boolet.png")

--"i don't know how to dot reference" variables
local direction = math.sin(count/600)*360*5+(b_direction)
local turn = b_turning
local speed = b_speed
local addacc = b_addacceleration
local multacc = b_multacceleration
local delay = b_changedelay
local maxspd = b_maxspeed
local minspd = b_minspeed

function bullet:new()
	dir2hv(direction, speed)
	bulletcount = bulletcount+1
	--print(speed)
end

function bullet:update(dt)
	x = x+hspd*dt
	y = y+vspd*dt
	if math.abs(x-ecks)<=4 and math.abs(y-whai)<=4 then
		bulletcount = 0
		bullets = {}
	end
	if not(delay <= 0) then
		delay = delay-dt
	else
		if not(turn == 0) then --the moving zone
			direction = direction+turn
		end
		if not(addacc == 0) then
			speed = speed+addacc*dt
		end
		if not(multacc == 1) then
			speed = speed*(multacc*dt)
		end
		dir2hv(direction, speed, id)
		--speed = math.clamp(speed, minspd, maxspd)
	end
end

function bullet:draw(dt)
	love.graphics.draw(sprite_index, x, y, (direction-90)*.0175, 1, 1, 16, 16, 0, 0)
end

function boolnum(value)
  return value and 1 or 0
end


function dir2hv(angle, spd)
	hspd = math.cos(angle*.0175)*spd;
	vspd = math.sin(angle*.0175)*spd;
end

return bullet