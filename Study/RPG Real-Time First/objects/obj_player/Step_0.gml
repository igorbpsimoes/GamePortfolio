if(instance_exists(obj_dialog)) exit;

var _move_left = keyboard_check(ord("A"));
var _move_right = keyboard_check(ord("D"));

var _move_up = keyboard_check(ord("W"));
var _move_down = keyboard_check(ord("S"));

var _move_hor = _move_right - _move_left;
var _move_ver = _move_down - _move_up;

var moving = (_move_hor != 0 or _move_ver != 0);
var attacking = keyboard_check_pressed(vk_space);

if(moving) {
    if(_move_ver > 0) sprite_index = spr_player_walk_down;
    else if(_move_ver < 0) sprite_index = spr_player_walk_up;
    else if(_move_hor > 0) sprite_index = spr_player_walk_right;
    else if(_move_hor < 0) sprite_index = spr_player_walk_left;

    facing = point_direction(0, 0, _move_hor, _move_ver);
} else if(variable_struct_exists(walk_to_idle_sprite, sprite_index)) {
    sprite_index = variable_struct_get(walk_to_idle_sprite, sprite_index)
}

move_and_collide(_move_hor * move_speed, _move_ver * move_speed, collision_tilemap, undefined, undefined, undefined, move_speed, move_speed);

if(attacking) {
    var _inst = instance_create_depth(x, y, depth, obj_attack);
    _inst.image_angle = facing;
    _inst.damage *= damage;
}
