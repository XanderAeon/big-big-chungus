function makebul(ecks, whai, dir, spd)
	bullet = {x = ecks, y = whai, width = 16, height=16, hspd=hespd, vspd=vespd, img = bulsprite}
    table.insert(bullets, bullet)
	dir2hv(dir, spd)
end
function bulupdate()
	for index, bullet in ipairs(bullets) do
    bullet.x = bullet.x+bullet.hspd
	bullet.y = bullet.y+bullet.vspd
    if bullet.x > winwidth or bullet.x < 0 or bullet.y > winheight or bullet.y < 0 then
      table.remove(bullet, index)
    end
  end
end
function buldraw()
	for index, bullet in ipairs(bullets) do
		love.graphics.draw(bullet.img, bullet.x, bullet.y, 0, 1, 1, 10, 10, 0, 0)
	 end
end