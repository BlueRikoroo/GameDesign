event_inherited()
#region Controls

c_left = vk_left
c_right = vk_right
c_jump = vk_up
c_down = vk_down
c_grab = vk_space
c_grab_crate = vk_alt

#endregion
#region Movement 

groundSpeed = 5
jumpSpeed = 20
accelVal = 0.3
faceingDirection = Dir.right //1 for right, -1 for left
relHoriSpeed = 0 //Relative speed gained from platforms
onGround = false
grabbing = false

#endregion
#region Abilities

canPushWall = false
canWallJump = false

#endregion
#region Aniamtions

anim_default = spr_player_default_b
anim_jumping = spr_player_jump_b
anim_falling = spr_player_falling_b
anim_holdingCrate = spr_player_holdCrate_b
anim_hangingOnHandle = spr_player_handle_b
anim_moving = spr_player_moving_b
anim_climbingWall = spr_player_climbingWall_b
anim_pullingSelfUpRope = spr_player_pullingSelfUpRope_b

sprite_index = anim_default

enum Anim{ idle, jumping, falling, holdingCrate, hangingOnHandle, moving, climbingWall, pullingSelfUpRope}

#endregion
#region Flags

holdingItem = false
heldItem = noone

#endregion
