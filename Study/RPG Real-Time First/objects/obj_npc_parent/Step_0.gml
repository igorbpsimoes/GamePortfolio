if(instance_exists(obj_dialog)) exit;

if(instance_exists(obj_player) && distance_to_object(obj_player) < 4) {
    can_talk = true;
    if(keyboard_check_pressed(input_key)) create_dialog(dialog);
} else {
    can_talk = false;
}
