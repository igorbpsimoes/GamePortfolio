if(alarm[0] < 0) {
    alarm[0] = 60; 
    
    hp -= other.damage;
    image_blend = c_red;
    
    if(hp <= 0) room_restart();
}