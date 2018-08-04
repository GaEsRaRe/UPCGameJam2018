extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	if(Input.is_key_pressed("R")):
		move_and_collide(Vector2(100,0) * delta)
	pass