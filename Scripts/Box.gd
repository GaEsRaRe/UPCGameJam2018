extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var to_move = false
var direction = Vector2(0,0)

enum Movement{NONE,UP,RIGHT,DOWN,LEFT}

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	if to_move:
		move_and_slide(globals.player_speed * direction)
	pass

func go(dir):
	
	match dir:
		Movement.UP:
			direction = globals.UP
		Movement.LEFT:
			direction = globals.LEFT
		Movement.RIGHT:
			direction = globals.RIGHT
		Movement.DOWN:
			direction = globals.DOWN
	set_physics_process(true)
	to_move = true
	
	pass

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player") :
		if body.is_dashing and (body.direction == Movement.UP or body.direction == Movement.DOWN):
			go(body.direction)
			

	pass # replace with function body


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		set_physics_process(false)
		direction = Vector2(0,0)
		#to_move = false
		
	pass # replace with function body


func _on_Horizontal_body_entered(body):
	if body.is_in_group("Player"):
		if body.is_dashing and (body.direction == Movement.LEFT or body.direction == Movement.RIGHT):
			go(body.direction)
		
	pass # replace with function body
