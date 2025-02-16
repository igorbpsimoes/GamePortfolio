function init_walk_to_idle() {
    var struct_map = {};
    
    var sprite_pairs = [
        [spr_player_walk_up, spr_player_idle_up],
        [spr_player_walk_down, spr_player_idle_down],
        [spr_player_walk_right, spr_player_idle_right],
        [spr_player_walk_left, spr_player_idle_left]
    ];
    
    for (var i = 0; i < array_length(sprite_pairs); i++) {
        var walk_sprite = sprite_pairs[i][0];
        var idle_sprite = sprite_pairs[i][1];
        variable_struct_set(struct_map, walk_sprite, idle_sprite);
    }
    
    return struct_map;
};

move_speed = 1;

collision_tilemap = layer_tilemap_get_id("Tiles_Col");

walk_to_idle_sprite = init_walk_to_idle();

hp = 10;
hp_total = hp;
damage = 1;

facing = 0;

level = 1;
xp = 0;
xp_require = 100;

function add_xp(_xp_to_add) {
    xp += _xp_to_add;
    if(xp < xp_require) return;
    
    level++;
    xp -= xp_require;
    xp_require *= 1.4;
    
    hp_total += 5;
    hp = hp_total;
    damage += 0.8;
}