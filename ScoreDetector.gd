extends Area2D


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	position.x -=  Global.platSpeed
	
	if position.x < -10000:
		queue_free()


func _on_ScoreDetector_body_entered(body):
	if body.is_in_group("player"):
			Global.score+=1
