extends KinematicBody2D

# OLD VARIABLES, may be reused
#var speed = 80
#onready var obj = get_parent().get_node("KinematicBody2D")
#var player = get_parent().get_node("KinematicBody") 
#var EnemyToPlayer = player.global_position - self.global_position
#var maxDistance = 200
#var FOV = 180

const MOVE_SPEED = 80

onready var raycast = $RayCast2D

var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("zombies")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(delta):
	if player == null:
		return
	var vec_to_player = player.global_position - global_position
	vec_to_player = vec_to_player.normalized()
	raycast.global_rotation = atan2(vec_to_player.y, vec_to_player.x)
	#global_rotation = atan2(vec_to_player.y, vec_to_player.x)
	# rotation bit i asume we dont need
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
	
	if raycast.is_colliding():
		var coll = raycast.get_collider()
		if coll.name == "KinematicBody2D":
			coll.kill()
			
func kill():
	queue_free()

func set_player(p):
	player = p


# ALL OF THIS old code, may be reused
#	var dir = (obj.global_position - global_position).normalized()
#	if EnemyToPlayer.length() < maxDistance:
#		if acos(EnemyToPlayer.normalized().dot(dir)) < FOV:
#			$RayCast2D.cast_to = EnemyToPlayer
#			if $RayCast2D.is_colliding():
#				if $RayCast2D.get_collider() == player:
#						#var dir = (obj.global_position - global_position).normalized()
#						move_and_collide(dir * speed * delta)
