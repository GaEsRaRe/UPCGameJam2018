extends KinematicBody2D



func _ready():
	
	set_physics_process(true)
	pass


func _physics_process(delta):
	
	pass
	
func _movement():
	if Input.is_action_pressed("ui_up"):
		move_and_collide(globals.UP * delta * globals.player_speed)
	pass