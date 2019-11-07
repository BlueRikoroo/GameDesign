switch(stage){
case Stage.warpIn:
	var scale = (1-(stageTimer/30))*7
	var c1x = warpPoint1x, c2x = warpPoint2x
	var c1y = warpPoint1y, c2y = warpPoint2y
	draw_sprite_ext(spr_Portal, -1, c1x, c1y, scale, scale, stageTimer*50, -1, 1)
	if !(c1x == c2x and c1y == c2y){
		draw_sprite_ext(spr_Portal, -1, c2x, c2y, scale, scale, -stageTimer*50, -1, 1)
	}
	break
case Stage.warpIn2:
	var scale = (stageTimer/30)*7
	var c1x = warpPoint1x, c2x = warpPoint2x
	var c1y = warpPoint1y, c2y = warpPoint2y
	draw_sprite_ext(spr_Portal, -1, c1x, c1y, scale, scale, stageTimer*50, -1, 1)
	if !(c1x == c2x and c1y == c2y){
		draw_sprite_ext(spr_Portal, -1, c2x, c2y, scale, scale, -stageTimer*50, -1, 1)
	}
	break
case Stage.warpOut:
	var scale = (1-(stageTimer/30))*7
	draw_sprite_ext(spr_Portal, -1, warpPoint1x, warpPoint1y, scale, scale, stageTimer*50, -1, 1)
	break
case Stage.warpOut2:
	var scale = (stageTimer/30)*7
	draw_sprite_ext(spr_Portal, -1, warpPoint1x, warpPoint1y, scale, scale, stageTimer*50, -1, 1)
	break
}