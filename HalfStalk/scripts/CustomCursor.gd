extends Node2D

var cross = load ("res://assets/UIElements/customMouse.png")
var hotspot = Vector2(8,8)

func _ready():
	
	Input.set_custom_mouse_cursor(cross, 0,hotspot)
	#Input.set_custom_mouse_cursor(cross, Input.CURSOR_IBEAM)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
