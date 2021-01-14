class = require 'lib/hump/class'
--from https://github.com/vrld/hump

asswipe = require 'objects/asswipe'

function love.load()
	love.window.setMode(640, 480)
	understale = 0
end

function love.update(dt)
	understale = understale+dt
	asswipe:update()
end

function love.draw()
	love.graphics.print(understale, 320, 240)
end
