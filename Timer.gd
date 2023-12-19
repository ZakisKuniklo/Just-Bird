extends Timer

var plataforma = preload("res://plataformas.tscn")
var scoreDetec = preload("res://ScoreDetector.tscn")



func _on_Timer_timeout():
	var criador = [plataforma.instantiate(),plataforma.instantiate(),scoreDetec.instantiate()]
	var x = 1100
	var y = randf_range(150,300)
	var y2 = y - randf_range(500,600)
	criador[0].position = Vector2(x,y)
	criador[1].position = Vector2(x,y2)
	criador[2].position = Vector2(x+30,y+30)
	criador[2].scale = Vector2 (1,y2-y)
	add_child(criador[0])
	add_child(criador[1])
	add_child(criador[2])
	wait_time = 3
	
	
