extends KinematicBody2D

enum Movement{NONE,UP,RIGHT,DOWN,LEFT}
var speed = 0
var is_dashing = false

var direction = Movement.NONE
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	set_physics_process(true)
	pass

func _physics_process(delta):
	if direction == Movement.NONE:
		_selector()
	else:
		if is_dashing:
			
			_movement(delta)
		else:
			_dash_selector(delta)
			_movement(delta)
	pass


#MOVEMENT

func _dash_selector(delta):
	match direction:
		Movement.UP:
			if Input.is_action_just_pressed("ui_up"):
				speed *= 2
				is_dashing = true
				print("DASH!!")
		Movement.DOWN:
			if Input.is_action_just_pressed("ui_down"):
				speed *= 2
				is_dashing = true
				print("DASH!!")
		Movement.LEFT:
			if Input.is_action_just_pressed("ui_left"):
				speed *= 2
				is_dashing = true
				print("DASH!!")
		Movement.RIGHT:
			if Input.is_action_just_pressed("ui_right"):
				speed *= 2
				is_dashing = true
				print("DASH!!")
	pass
func _movement(delta):
	match direction:
		Movement.UP:
			move_and_slide(globals.UP * speed, Vector2(0,-1))
			if is_on_ceiling():
				_kill_movement()
		Movement.RIGHT:
			move_and_slide(globals.RIGHT * speed, Vector2(0,-1))
			if is_on_wall():
				_kill_movement()
		Movement.DOWN:
			move_and_slide(globals.DOWN * speed, Vector2(0,-1))
			if is_on_floor():
				_kill_movement()
		Movement.LEFT:
			move_and_slide(globals.LEFT * speed, Vector2(0,-1))
			if is_on_wall():
				_kill_movement()
	
	pass

func _selector():
	if Input.is_action_just_pressed("ui_up"):
		direction = Movement.UP
		speed = globals.player_speed
	elif Input.is_action_just_pressed("ui_right"):
		direction = Movement.RIGHT
		speed = globals.player_speed
	elif Input.is_action_just_pressed("ui_down"):
		direction = Movement.DOWN
		speed = globals.player_speed
	elif Input.is_action_just_pressed("ui_left"):
		direction = Movement.LEFT
		speed = globals.player_speed
	pass
	
func _kill_movement():
	direction = Movement.NONE
	
	pass

