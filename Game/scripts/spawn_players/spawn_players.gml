/// @description Spawns both players in the map
/// @param P1x
/// @param P1y
/// @param ropeLength


// Returns [player1, player2, rope]

var boyChar = instance_create_layer(argument0, argument1, get_layer_depth(0), obj_player)
var girlChar = instance_create_layer(argument0, argument1, get_layer_depth(0), obj_player)
var rope = instance_create_layer(0, 0, get_layer_depth(1), obj_rope)
var camera = instance_create_layer(0, 0, get_layer_depth(0), obj_camera)

boyChar.c_left = ord("A")
boyChar.c_right = ord("D")
boyChar.c_jump = ord("W")
boyChar.c_down = ord("S")
boyChar.image_xscale = 2
boyChar.image_yscale = 3
boyChar.attached_obj[0] = girlChar
boyChar.rope_obj[0] = rope
boyChar.groundSpeed = 4
boyChar.jumpSpeed = 14.5
boyChar.accelVal = 0.2
boyChar.canPushWall = true
boyChar.jumpSound = Boy_Jump
boyChar.landSound = Boy_Landing
boyChar.fallSound = Boy_Fall

girlChar.c_left = ord("J")
girlChar.c_right = ord("L")
girlChar.c_jump = ord("I")
girlChar.c_down = ord("K")
girlChar.image_xscale = 1.5
girlChar.image_yscale = 2
girlChar.attached_obj[0] = boyChar
girlChar.rope_obj[0] = rope
girlChar.groundSpeed = 5
girlChar.jumpSpeed = 17
girlChar.accelVal = 0.3
girlChar.anim_default = spr_player_default_g
girlChar.anim_jumping = spr_player_jump_g
girlChar.anim_falling = spr_player_fall_g
girlChar.anim_holdingCrate = spr_player_holdCrate_g
girlChar.anim_moving = spr_player_moving_g
girlChar.anim_hangingOnHandle = spr_player_handle_g
girlChar.anim_climbingWall = spr_player_climbingWall_g
girlChar.anim_pullingSelfUpRope = spr_player_pullingSelfUpRope_g
girlChar.canWallJump = true
girlChar.jumpSound = Girl_Jump
girlChar.landSound = Girl_Landing
girlChar.fallSound = Girl_Fall

rope.obj1 = boyChar
rope.obj2 = girlChar
rope.maxLength = argument2

camera.character1 = boyChar
camera.character2 = girlChar
camera.char1X = boyChar.x
camera.char1Y = boyChar.y
camera.char2X = girlChar.x
camera.char2Y = girlChar.y
var posx = (boyChar.x + girlChar.x) * 0.5
var posy = (boyChar.y + girlChar.y) * 0.5
camera_set_view_pos(camera.camera, posx, posy)

return [boyChar, girlChar, rope, camera]