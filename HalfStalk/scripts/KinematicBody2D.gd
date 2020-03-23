extends KinematicBody2D

export (int) var speed = 2

var velocity = Vector2()

#onready var raycast = $RayCast2D

func cartesian_to_isometric(cartesian):
	var screen_pos = Vector2()
	screen_pos.x = cartesian.x - cartesian.y
	screen_pos.y = (cartesian.x + cartesian.y) / 2
	return screen_pos 

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.y -= 1
		$Sprite.flip_h = false
	if Input.is_action_pressed('left'):
		velocity.y += 1
		$Sprite.flip_h = true
	if Input.is_action_pressed('down'):
		velocity.x += 1
		$Sprite.flip_h = false
	if Input.is_action_pressed('up'):
		velocity.x -= 1
		$Sprite.flip_h = true

	velocity = velocity.normalized() * speed
	velocity = cartesian_to_isometric(velocity)

func _physics_process(delta):
	get_input()
	velocity = move_and_collide(velocity)
	
	var look_vec = get_global_mouse_position() - global_position
	
	if Input.is_action_pressed("left_click"):
		if look_vec.x > 0:
			$Sprite.flip_h = false
		if look_vec.x < 0:
			$Sprite.flip_h = true
	
	# This is for flipping the character based on mouse pos
	#if look_vec.x > 0:
	#	$Sprite.flip_h = false
	#if look_vec.x < 0:
	#	$Sprite.flip_h = true
	
	#global_rotation = atan2(look_vec.y, look_vec.x)
