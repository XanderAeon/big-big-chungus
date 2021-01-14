class = require 'libraries/hump/class'
--from https://github.com/vrld/hump

function love.load()
	love.window.setMode(640, 480)
	understale = 0
end

function love.update(dt)
	understale = understale+dt
end

function love.draw()
	love.graphics.print(understale, 320, 240)
end
