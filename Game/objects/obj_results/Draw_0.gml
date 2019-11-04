
draw_set_halign(fa_center);
draw_text(room_width/2, 50,"LEVEL COMPLETE!");
draw_text(room_width/2, 150,"COMPLETION TIME:   " + string(global.minutes) + ":" + string(global.seconds));
draw_text(room_width/2, 200,"DEATHS:   " + string(global.deaths/2));
draw_text(room_width/2, 500,"Press Enter To Continue...");