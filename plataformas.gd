extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	position.x -=  Global.platSpeed
	
	if position.x < -10000:
		queue_free()

