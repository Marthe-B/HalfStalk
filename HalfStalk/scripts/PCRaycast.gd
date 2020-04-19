extends RayCast2D

#onready var raycast = $RayCast2D

# not sure if this is the way to to it
# This is for having the raycast2d follow the mouse
# without rotating the character

func _physics_process(_delta):
	var look_vec = get_global_mouse_position() - global_position
	global_rotation = atan2(look_vec.y, look_vec.x)
