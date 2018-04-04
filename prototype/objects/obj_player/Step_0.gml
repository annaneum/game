/// @desc 

//update input
var move_left			= keyboard_check(key_left);
var move_right			= keyboard_check(key_right);
var move_jump			= keyboard_check(key_jump);
var input_attack_primary		= keyboard_check_pressed(key_attack_primary);

#region movement
var bbox_side;

//stuck
if (tilemap_get_at_pixel(COLLISION_TILEMAP, bbox_left, bbox_bottom) > 0 && tilemap_get_at_pixel(COLLISION_TILEMAP, bbox_right, bbox_bottom) != 0) {
	y -= 1;
}

//horizontal movement
xInput = move_right - move_left;

//image_xscale
image_xscale = (xInput != 0) ? sign(xInput) : image_xscale;

xSpeed += xSpeed_fraction;

if (xInput != 0) {
	xSpeed += xInput * accel;
} else if (xSpeed != 0){
	xSpeed -= (xSpeed) * frict;
}

xSpeed = clamp(xSpeed, -maxRunSpeed, maxRunSpeed);

xSpeed_fraction = xSpeed - floor(abs(xSpeed)) * sign(xSpeed);
xSpeed -= xSpeed_fraction;

//colision check
//horizontal
bbox_side = (xSpeed > 0) ? bbox_right : bbox_left;
if (tilemap_get_at_pixel(COLLISION_TILEMAP, bbox_side + xSpeed, bbox_top) > 0 || tilemap_get_at_pixel(COLLISION_TILEMAP, bbox_side + xSpeed, bbox_bottom) > 0) {
	if (xSpeed > 0) x = x - (x mod 32) + 31 - (bbox_right - x);
	else x = x - (x mod 32) - (bbox_left - x);
	xSpeed = 0;
	xSpeed_fraction = 0;
}

x += xSpeed;

//vertical movement
//yInput = move_jump;

//ySpeed += ySpeed_fraction;

////wenn auf boden dann spring
//if (yInput && vert_state == Vert_State.onGround) {
//	ySpeed = jumpPower;
//	jumpCount += 1;
//} else if (yInput && jumpCount < maxJumpCount-1 && vert_state != Vert_State.onGround) {
//	ySpeed = jumpPower;
//	jumpCount += 1;
//}

//jumpCount = (vert_state == Vert_State.onGround) ? 0 : jumpCount;

////state changing & boden überprufen -> fall
//if (ySpeed < 0) {
//	vert_state = Vert_State.jumping;
//} else if (ySpeed > 0 || !(tilemap_get_at_pixel(COLLISION_TILEMAP, bbox_left, bbox_bottom + ceil(weight)) > 0 || tilemap_get_at_pixel(COLLISION_TILEMAP, bbox_right, bbox_bottom + ceil(weight)) > 0)) {
//	vert_state = Vert_State.falling;
//}

//ySpeed_fraction = ySpeed - floor(abs(ySpeed)) * sign(ySpeed);
//ySpeed -= ySpeed_fraction;

////Boden und Decke überprüfen und landen
//bbox_side = (ySpeed > 0) ? bbox_bottom : bbox_top;
//if (tilemap_get_at_pixel(COLLISION_TILEMAP, bbox_left, bbox_side + ySpeed) > 0 || tilemap_get_at_pixel(COLLISION_TILEMAP, bbox_right, bbox_side + ySpeed) > 0) {
//	if (ySpeed > 0) y = y - (y mod 32) + 31 - (bbox_bottom - y);
//	else y = y - (y mod 32) - (bbox_top - y);
//	ySpeed = 0;
//	ySpeed_fraction = 0;
	
//	vert_state = (vert_state == Vert_State.falling) ? Vert_State.onGround : Vert_State.falling;
//}

//y += ySpeed;

#endregion
