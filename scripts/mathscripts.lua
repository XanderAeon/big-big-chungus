function get(value)
	return value
end
function boolnum(value)
  return value and 1 or 0
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

function dir2hv(angle, spd)
	bullet.hspd = math.cos(angle*.0175)*spd;
	bullet.vspd = math.sin(angle*.0175)*spd;
end