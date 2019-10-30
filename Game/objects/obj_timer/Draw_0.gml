draw_set_font(ft_time);
draw_set_halign(fa_left);

var time = "TIME - "+string(global.minutes)+":"+string(global.seconds);
draw_text(10, 10,time);