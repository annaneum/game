/// @desc 
#macro COLLISION_TILEMAP layer_tilemap_get_id("Collision")

sprite_idle = spr_player_idle;
sprite_attack1 = spr_player_attack1;
sprite_attack2 = spr_player_attack2;
sprite_attack3 = spr_player_attack3;

key_left = ord("A");
key_right = ord("D");
key_jump = vk_space;
key_attack_primary = ord("K");
key_attack_secondary = ord("L");

xSpeed = 0;
ySpeed = 0;

xSpeed_fraction = 0;
ySpeed_fraction = 0;

accel = .4;
frict = .2;
maxRunSpeed = 4.8;

weight = .5;
jump_power = -7;
maxJumpHeight = 100;
maxFallSpeed = 12;