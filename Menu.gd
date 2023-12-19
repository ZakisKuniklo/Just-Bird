extends Control




func _on_start_pressed():
	Global.score = 0
	Global.platSpeed = 1
	get_tree().change_scene_to_file("res://cenário.tscn")

func _on_sair_pressed():
	get_tree().quit()
