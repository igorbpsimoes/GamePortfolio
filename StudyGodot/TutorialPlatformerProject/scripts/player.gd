extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	
	var moving_right := direction > 0
	var moving_left := direction < 0
	var idle := direction == 0
	
	# Flip the Sprite
	if moving_right:
		animated_sprite.flip_h = false
	elif moving_left:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():	
		# Handle jump
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			animated_sprite.play("jumping") 
		elif idle:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("running")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
