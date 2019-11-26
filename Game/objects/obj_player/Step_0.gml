

var maxRope = false
for(var i = 0; i < array_length_1d(rope_obj); i++){
	if instance_exists(rope_obj[i]) and rope_obj[i].maxReached{
		maxRope = true
		break
	}
}

onGround = place_meeting(x,y+1,par_wall) or (vspeed == 0 and (place_meeting(x,y+1,obj_crate) or place_meeting(x,y+1,obj_Platform)))

#region Animations

if onGround and hspeed == 0
	player_playAnimation(Anim.idle)	
else if vspeed > 0
	player_playAnimation(Anim.falling)

if sprite_index = anim_jumping{
	player_playAnimation(Anim.jumping)	
}

#endregion
#region Jump

if keyboard_check_pressed(c_jump) and onGround{	
	vspeed -= jumpSpeed
	audio_play_sound(jumpSound,5,false);
	player_playAnimation(Anim.jumping)
}
#endregion

#region Move left and Right

if keyboard_check(c_right){
	faceingDirection = Dir.right
	if onGround{
		hspeed = min(hspeed + accelVal, groundSpeed)
		player_playAnimation(Anim.moving)
	}else if hspeed < groundSpeed
		hspeed += accelVal
}
else if keyboard_check(c_left){
	faceingDirection = Dir.left
	if onGround{
		hspeed = max(hspeed - accelVal, -groundSpeed)
		player_playAnimation(Anim.moving)
	}else if hspeed > -groundSpeed
		hspeed -= accelVal
}else if (onGround or !maxRope){
	if abs(hspeed) < 1
		hspeed = 0
	else{
		player_playAnimation(Anim.moving)
		hspeed -= sign(hspeed)*0.3
	}
}

#endregion
#region Climb wall if other player is above

if keyboard_check(c_jump) and vspeed >= -2{
	for(var i = 0; i < array_length_1d(rope_obj); i++){
		var otherOnGround = false
		with(attached_obj[i])
			otherOnGround = place_meeting(x,y+1,par_wall)
			
		if attached_obj[i].y < y and otherOnGround{
			if ((keyboard_check(c_left) and attached_obj[i].x < x and place_meeting(x-1,y,par_wall))
			  or (keyboard_check(c_right) and attached_obj[i].x > x and place_meeting(x+1,y,par_wall))){
				vspeed = -2
				player_playAnimation(Anim.climbingWall)
			}
		}
	}
}

#endregion
#region Grab Handle Movement

enableGravity = true
grabbing = (place_meeting(x,y,obj_Handle) and !holdingItem and keyboard_check(c_grab))
if grabbing{
	var climbHori = 1
	var climbVert = climbHori
	hspeed = 0
	vspeed = 0
	enableGravity = false
	if keyboard_check(c_left)
		hspeed = -climbHori
	else if keyboard_check(c_right)
		hspeed = climbHori
	else if keyboard_check(c_jump)
		vspeed = -climbVert
	else if keyboard_check(c_down)
		vspeed = climbVert
	player_playAnimation(Anim.hangingOnHandle)
}

#endregion

#region Wall Jump

if (canWallJump){
	if (keyboard_check_pressed(c_right) and place_meeting(x-1,y,par_wall) and !onGround){
		hspeed = groundSpeed
		vspeed = -jumpSpeed
		player_playAnimation(Anim.jumping)
	}
	if (keyboard_check_pressed(c_left) and place_meeting(x+1,y,par_wall) and !onGround){
		hspeed = -groundSpeed
		vspeed = -jumpSpeed
		player_playAnimation(Anim.jumping)
	}
}

#endregion
// Inherit the parent event
event_inherited();

#region Grab handle Velocity Stop

if grabbing{
	var climbHori = 1
	var climbVert = climbHori
	if !(keyboard_check(c_left) or
	  keyboard_check(c_right) or
  	  keyboard_check(c_jump) or
	  keyboard_check(c_down)){
		hspeed = 0	
		vspeed = 0
	}
}

#endregion

#region Grab crate

if keyboard_check_pressed(c_grab_crate)
{
	if (heldItem == noone)
	{
		with (instance_place(x,y,obj_crate))
		{
			other.heldItem = self
			parent = other
			other.holdingItem = true
		}
		if heldItem != noone
			player_playAnimation(Anim.holdingCrate)
	}
	else
	{
		if (heldItem != noone){
			sprite_index = anim_default
		}
		heldItem.parent = noone
		heldItem = noone
		holdingItem = false
	}
}

#endregion

#region Pushing Giant Wall

if canPushWall{
	var pushSpeed = 1
	if keyboard_check(c_right){
		with (instance_place(x+pushSpeed,y,obj_HWall)){
			if (!place_meeting(x+pushSpeed,y,par_wall)){
				hspeed = pushSpeed
				other.hspeed = pushSpeed
			}
		}
	}
	if keyboard_check(c_left){
		with (instance_place(x-pushSpeed,y,obj_HWall)){
			if (!place_meeting(x-pushSpeed,y,par_wall)){
				hspeed = -pushSpeed
				other.hspeed = -pushSpeed
			}
		}
	}
}

#endregion
#region Standing on Crate

if(vspeed > 0 and place_meeting(x,y+vspeed,obj_crate)){
	//Don't Worry about crates that are higher
	with(obj_crate){
		if other.y > y-height+10
			instance_deactivate_object(self)	
	}
	
	//Find Crate Under and Stand on it
	var obj = instance_place(x, y+vspeed, obj_crate)
	if instance_exists(obj) and y <= obj.y-obj.height+10{
		while(!place_meeting(x,y+1,obj_crate))
			y++
		vspeed = 0
		if keyboard_check_pressed(c_jump){	
			vspeed -= jumpSpeed
		}
	}
	
	//Reactivate all the crates
	instance_activate_object(obj_crate)
}

#endregion
#region Moving Platform Interaction

vertical_collision(obj_Platform)
if(place_meeting(x,y+1,obj_Platform)){
	var Pinstance = instance_place(x, y+1, obj_Platform);
	if(Pinstance.Horizontal_Platform = true){
		vspeed = 0;
		if keyboard_check_pressed(c_jump) and onGround{	
			vspeed -= jumpSpeed
		}
		relHoriSpeed = Pinstance.horizontal_speed * Pinstance.dir;
	}else{
		vertical_collision(Pinstance);
		vspeed = Pinstance.vertical_speed * Pinstance.dir;
		if keyboard_check_pressed(c_jump){	
			vspeed -= jumpSpeed
		}
	}
}
horizontal_collision(obj_Platform)
	
#endregion
#region Rope Climb if Dangling

if instance_exists(attached_obj[0]) and instance_exists(rope_obj[0]){
	var ropeSpeed = 4
	if !onGround and !grabbing{
		if keyboard_check(c_jump) and (attached_obj[0].onGround or attached_obj[0].grabbing)
		  and !place_meeting(x-1,y,par_wall) and !place_meeting(x+1,y,par_wall){
			if rope_obj[0].maxLength > 150 and rope_obj[0].length + 10 > rope_obj[0].maxLength {
				rope_obj[0].tempMaxReduction += ropeSpeed
				rope_obj[0].maxLength -= ropeSpeed
				player_playAnimation(Anim.pullingSelfUpRope)
			}
		}else if rope_obj[0].tempMaxReduction > 0{
			rope_obj[0].tempMaxReduction -= ropeSpeed
			rope_obj[0].maxLength += ropeSpeed
			if (sprite_index = anim_pullingSelfUpRope) sprite_index = anim_falling
		}
	}else if (attached_obj[0].onGround or attached_obj[0].grabbing) and rope_obj[0].tempMaxReduction > 0{
		rope_obj[0].tempMaxReduction -= ropeSpeed
		rope_obj[0].maxLength += ropeSpeed
		if (sprite_index = anim_pullingSelfUpRope) sprite_index = anim_falling
	}
}

#endregion
#region Landing Sound
var curr_coll = place_meeting(x,y+1,par_wall);
var prev_coll = place_meeting(xprevious,yprevious+1,par_wall);

if ( (curr_coll==1) && (prev_coll==0) )
{
    var snd = audio_play_sound(landSound,5,false);
	audio_sound_gain(snd, 0.5, 0)
}

#endregion
#region Relative Speed

//THIS SECTION NEEDS TO GO LAST
//Nothing Modifying HSPEED should go after this
hspeed += relHoriSpeed

#endregion