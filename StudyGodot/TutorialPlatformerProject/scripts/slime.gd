extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(ray_cast_right.is_colliding()):
		direction = -1
		_flip_direction()
	if(ray_cast_left.is_colliding()):
		direction = 1
		_flip_direction()

	position.x += direction * SPEED * delta
	
func _flip_direction() -> void:
	animated_sprite.flip_h = direction == -1
