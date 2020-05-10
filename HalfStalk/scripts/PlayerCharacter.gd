extends KinematicBody2D

export (int) var speed = 2

var velocity = Vector2()
var maxHealth = 100
var currentHealth = 100

onready var raycast = $RayCast2D

func _ready():
	yield(get_tree(), "idle_frame")
	get_tree().call_group("zombies", "set_player", self)

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

func _physics_process(_delta):
	get_input()
	velocity = move_and_collide(velocity)
	
	var look_vec = get_global_mouse_position() - global_position
	
	if Input.is_action_pressed("left_click"):
		if look_vec.x > 0:
			$Sprite.flip_h = false
		if look_vec.x < 0:
			$Sprite.flip_h = true
			
	#Function to shoot, to be replaced later
	#if Input.is_action_just_pressed("left_click"):
	#	var coll = raycast.get_collider().get_parent()
	#	if raycast.is_colliding() and coll.has_method("killEnemy"):
	#		coll.killEnemy()
	if Input.is_action_just_pressed("left_click") and raycast.is_colliding():
		var coll = raycast.get_collider().get_parent()
		if raycast.is_colliding() and coll.has_method("killEnemy"):
			coll.takeDamage()

# function to kill player and reload scene
# too be replaced later
func takeDamage():
	currentHealth = currentHealth - 20
	$Particles2D.restart()
	if currentHealth <= 0:
		kill()

func kill():
	get_tree().reload_current_scene()
	
	# This is for flipping the character based on mouse pos
	#if look_vec.x > 0:
	#	$Sprite.flip_h = false
	#if look_vec.x < 0:
	#	$Sprite.flip_h = true
	
	#global_rotation = atan2(look_vec.y, look_vec.x)
