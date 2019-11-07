draw_set_color(c_black)
draw_set_alpha(0.3)
draw_rectangle(0, 0, 1920, 1080, false)
draw_set_alpha(1)


var c1 = c_white;
var c2 = merge_color(c_gray,c_white,0.25);
var c3 = merge_color(c_black,c_white,0.25);
var c4 = merge_color(c_white,c_white,0.25);
draw_set_halign(fa_center);
draw_text_transformed_color(1920/2, 50,"LEVEL COMPLETE!", 1, 1, 0, c1, c2, c3, c4, 1);
draw_text_transformed_color(1920/2, 150,"COMPLETION TIME:   " + string(global.minutes) + ":" + string(global.seconds), 1, 1, 0, c1, c2, c3, c4, 1);
draw_text_transformed_color(1920/2, 200,"DEATHS:   " + string(global.deaths), 1, 1, 0, c1, c2, c3, c4, 1);
draw_text_transformed_color(1920/2, 350,"TOTAL COLLECTABLES FOUND: " + string(global.totalCollected), 1, 1, 0, c1, c2, c3, c4, 1);
var total = global.coinsAvailable[global.currentLevel-1]
var xoffset = total*60-60
for(var i = 0; i < total; i++){
	draw_sprite(spr_levelCollectableIcon,obj_frame.coinsCollected[i],1920/2-xoffset+120*i,500)
}
draw_text_transformed_color(1920/2, 700,"Press Enter To Continue...", 1, 1, 0, c1, c2, c3, c4, 1);
