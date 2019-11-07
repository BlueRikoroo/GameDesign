draw_set_font(ft_time);
draw_set_halign(fa_left);
draw_set_valign(fa_top)
var time = "TIME - "+string(global.minutes)+":"+string(global.seconds);
draw_set_color(c_black)
draw_set_alpha(0.25)
draw_rectangle(0, 0, 20 + string_width(time), 50, false)
draw_set_alpha(1)
draw_set_color(c_white)

if(room != rm_start and room != rm_splash)
{
	draw_text(10, 10,time);
}