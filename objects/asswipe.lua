local class = require 'lib/hump/class'
asswipe = class{}
x = 50;
function asswipe:new()
end

function asswipe:update(dt)
    x = x+.5
	print(x)
end

return asswipe