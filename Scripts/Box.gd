extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var to_move = false
var direction = Vector2(0,0)
onready var camera = get_parent().get_parent().get_node("Camera2D")
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
		#print("Collision engaged", body.is_dashing)
		if body.is_dashing and (body.direction == Movement.UP):
			camera.shake(0.2,15,16)
			go(body.direction)
	pass # replace with function body


func _on_Area2D_body_exited(body):
	#
		
	pass # replace with function body


func _on_Horizontal_body_entered(body):
	if body.is_in_group("Player"):
		print("Collision engaged", body.is_dashing)
		if body.is_dashing and body.direction == Movement.LEFT:
			camera.shake(0.2,15,16)
			go(body.direction)
	pass # replace with function body


func _on_Horizontal2_body_entered(body):
	if body.is_in_group("Player"):
		print("Collision engaged", body.is_dashing)
		if body.is_dashing and body.direction == Movement.RIGHT:
			camera.shake(0.2,15,16)
			go(body.direction)
	pass # replace with function body


func _on_Vertical2_body_entered(body):
	if body.is_in_group("Player") :
		#print("Collision engaged", body.is_dashing)
		if body.is_dashing and (body.direction == Movement.DOWN):
			camera.shake(0.2,15,16)
			go(body.direction)
	pass # replace with function body
