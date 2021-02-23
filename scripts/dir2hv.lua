function dir2hv(angle, spd, id)

bullets[id].hspd = math.cos(angle*.0175)*spd;
bullets[id].vspd = -math.sin(angle*.0175)*spd;
print(hspd, vspd)
end