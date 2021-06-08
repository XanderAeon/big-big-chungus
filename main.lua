
asswipe = require 'objects/asswipe'
local mediator = {}
mediator.x = 320
mediator.y = 240
mediator.sprite_index = love.graphics.newImage("sprites/me.png")
bulsprite = love.graphics.newImage("sprites/booletwo.png")
bullets = {}

local gamestate = "startzone"


function love.load()
	winwidth = 640
	winheight = 480
	love.window.setMode(winwidth, winheight, {vsync = true})
	love.graphics.setBackgroundColor(.2, .4, .4)
end

function love.update(dt)
	dt = love.timer.getDelta()*200
	love.window.setTitle("Omnidirectional")
	asswipe:update(dt)
	bulupdate(dt)
end

function love.draw()
	if gamestate == "startzone" then
		love.graphics.draw(mediator.sprite_index, mediator.x, mediator.y, 0, 1, 1, 16, 16, 0, 0)
		love.graphics.printf("AMONG US", 0, winheight/2+50, winwidth, 'center')
	end
	for index, bullet in ipairs(bullets) do
		love.graphics.draw(bullet.img, bullet.x, bullet.y, 0, 1, 1, 10, 10, 0, 0)
	 end
	asswipe:draw()
end


function get(value)
	return value
end
function boolnum(value)
  return value and 1 or 0
end

function makebul(ecks, whai, hespd, vespd)
	bullet = {x = ecks, y = whai, width = 16, height=16, hspd=hespd, vspd=vespd, img = bulsprite}
    table.insert(bullets, bullet)
end
function bulupdate(dt)
	for index, bullet in ipairs(bullets) do
    bullet.x = bullet.x+bullet.hspd
	bullet.y = bullet.y+bullet.vspd
    if bullet.x > winwidth or bullet.x < 0 or bullet.y > winheight or bullet.y < 0 then
      table.remove(bullet, index)
    end
  end
end

function clamp(val, minimum, maximum)
	if val > maximum then
		val = maximum
	end
	if val < minimum then
		val = minimum
	end
	return val
end