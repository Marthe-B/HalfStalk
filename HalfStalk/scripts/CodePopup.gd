extends PopupPanel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#func _on_button_pressed():
      #get_node("PopupPanel").popup()

func _on_Area2D_body_entered(body):
	popup() # Replace with function body.
	



func _on_Area2D_body_exited(body):
	hide()# Replace with function body.d
