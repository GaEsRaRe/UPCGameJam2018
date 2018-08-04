extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	set_physics_process(true)
	pass


func _physics_process(delta):
	
	pass
	
func _movement():
	if Input.is_action_pressed("ui_up"):
		move_and_collide(globals.UP * delta * globals.player_speed)
	pass