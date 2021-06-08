class = require 'lib/hump/class'
--from https://github.com/vrld/hump

asswipe = require 'objects/asswipe'
bullets = {}
bulletcount = 0
count = 0
ecks = 0
whai = 0
love.window.setTitle("shihou")
--pattern = require 'patterns/attack'

global = {}

function global:bulletmake(x, y, direction, speed)
	bullets[bulletcount] = assert(love.filesystem.load("objects/bullet.lua"))()
	bullets[bulletcount]:new()
	bullets[bulletcount].x = x
	bullets[bulletcount].y = y
	bullets[bulletcount].direction = direction
	bullets[bulletcount].speed = speed
	bulletcount = bulletcount+1
end


function love.load()
	love.window.setMode(640, 480)
	understale = 0
end

function love.update(dt)
	dt = love.timer.getDelta()*200
	asswipe:update(dt)
	--pattern:update(dt)
	if (love.keyboard.isDown("z")) then
		bullet:new()
	end
	
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
	--love.graphics.print(math.floor(understale), 320, 240)
	asswipe:draw()
	
	for i=0, count, 1 do
		if i < #bullets then
			bullets[i]:draw()
		end
	end
	--pattern:draw()
end





bullet = {}
function bullet:new(ecks, whai, dir, spd)
	bullets[bulletcount] = self
	self.x = ecks or 320
	self.y = whai or 100
	self.direction = dir or 0
	self.hspd = spd or 5
	self.vspd = spd or 5
	sprite_index = love.graphics.newImage("sprites/boolet.png")
	bulletcount = bulletcount+1
end

function bullet:update(dt)
	self.x = self.x+self.hspd*dt
	self.y = self.y+self.vspd*dt
end
function bullet:draw(dt)
	love.graphics.draw(sprite_index, self.x, self.y, (self.direction-90)*.0175, 1, 1, 16, 16, 0, 0)
end


function dir2hv(angle, spd)
	hspd = math.cos(angle*.0175)*spd;
	vspd = math.sin(angle*.0175)*spd;
end
function boolnum(value)
  return value and 1 or 0
end