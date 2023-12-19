extends CharacterBody2D
signal death

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const GRAVITY = 220.0
const WALK_SPEED = 180
var speed = Vector2()
var control = 1



func _physics_process(delta):
	speed.y += delta * GRAVITY
	
	if Input.is_action_pressed("ui_up") and control ==1:
		speed.y = -WALK_SPEED
		
		
	set_velocity(speed)
	set_up_direction(Vector2(0, -1))
	set_floor_stop_on_slope_enabled(false)
	set_max_slides(4)
	set_floor_max_angle(0.785)
	# TODOConverter40 infinite_inertia were removed in Godot 4.0 - previous value `true`
	move_and_slide()
	
	for index in get_slide_collision_count():
		var collision  = get_slide_collision(index)
		if collision.get_collider() is StaticBody2D:
			emit_signal("death")
			control = 0
			Global.platSpeed =0
			if Input.is_action_pressed("ui_accept"):
				if Global.score < Global.hscore:
					Global.hscore = Global.score
				Global.score = 0
				Global.platSpeed = 1
				print(Global.platSpeed)
				get_tree().reload_current_scene()
	
	
			
	pass


