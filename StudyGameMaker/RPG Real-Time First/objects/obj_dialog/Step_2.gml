if(current_msg_idx < 0) exit;

var current_msg = messages[current_msg_idx].msg;

if(current_char < string_length(current_msg)) {
  current_char += char_speed * (1 + real(keyboard_check(input_key)));
  draw_message = string_copy(current_msg, 0, current_char);
} else if(keyboard_check_pressed(input_key)) {
  current_msg_idx++;

  if(current_msg_idx >= array_length(messages)) {
    instance_destroy();
  } else {
    current_char = 0;
  }
}
