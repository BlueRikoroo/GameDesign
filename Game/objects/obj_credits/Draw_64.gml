draw_set_font(ft_title);
draw_set_halign(fa_center);
draw_set_valign(fa_middle)
var c = c_white;
var c1 = c_gray;
var c2 = c_black;
var c3 = c_white;

switch(stage){
case 1:
	
	draw_text_transformed_color(
		room_width/2, 200, "SOUL CHAIN", 3, 3, 0,
		c,c1,c2,c3,1
		);
	break
case 2:
	var text = "Programming"
	text+="\nAaron Kendrick"
	text+="\nZach B."
	draw_text_transformed_color(
		room_width/2, room_height/2, text, 2, 2, 0,
		c,c1,c2,c3,1
		);
	break
case 3:
	var text = "Art"
	text+="\nPatrick Yee"
	text+="\nJW Banks"
	text+="\nChanthri So"
	draw_text_transformed_color(
		room_width/2, room_height/2, text, 2, 2, 0,
		c,c1,c2,c3,1
		);
	break
case 4:
	var text = "Level Design"
	text+="\nZach B."
	text+="\nJustin Talictic"
	text+="\nChanthri So"
	text+="\nAaron Kendrick"
	draw_text_transformed_color(
		room_width/2, room_height/2, text, 2, 2, 0,
		c,c1,c2,c3,1
		);
	break
case 5:
	var text = "Final Level Music and credit scenery"
	text+="\nprovided by:"
	text+="\nProject Amaranth"
	text+="\n(owned by Aaron)"
	draw_text_transformed_color(
		room_width/2, room_height/2, text, 2, 2, 0,
		c,c1,c2,c3,1
		);
	break
case 6:
	var text = "Thank you to everyone who contributed"
	text+="\nAaron Kendrick"
	text+="\nZach B."
	text+="\nPatrick Yee"
	text+="\nJW Banks"
	text+="\nChanthri So"
	text+="\nJustin Talictic"
	draw_text_transformed_color(
		room_width/2, room_height/2, text, 1.5, 1.5, 0,
		c,c1,c2,c3,1
		);
	break
}





draw_set_alpha(alpha)
draw_set_color(c_black)
draw_rectangle(0,0,1920,1080,false)
draw_set_alpha(1)