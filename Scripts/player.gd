extends KinematicBody2D

enum Movement{NONE,UP,RIGHT,DOWN,LEFT}
var speed = 0
onready var timer = get_node("Timer")
var is_dashing = false
onready var character_sprite = get_node("AnimatedSprite")
onready var tween = get_node("Tween")
var on_tween = false
var old_direction 
var direction = Movement.NONE
func _ready():
	character_sprite.play("UP")
	set_physics_process(true)
	pass

func _physics_process(delta):
	if direction == Movement.NONE:
		_selector()
	else:
		if not on_tween:
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
				on_tween = true
				speed *= 2
				is_dashing = true
				go_dash()
				print("DASH!!")
				
		Movement.DOWN:
			if Input.is_action_just_pressed("ui_down"):
				on_tween = true
				speed *= 2
				is_dashing = true
				go_dash()
				print("DASH!!")
				
		Movement.LEFT:
			if Input.is_action_just_pressed("ui_left"):
				on_tween = true
				speed *= 2
				is_dashing = true
				go_dash()
				print("DASH!!")
				
		Movement.RIGHT:
			if Input.is_action_just_pressed("ui_right"):
				on_tween = true
				speed *= 2
				is_dashing = true
				go_dash()
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
				character_sprite.play("DOWN")
				_kill_movement()
		Movement.LEFT:
			move_and_slide(globals.LEFT * speed, Vector2(0,-1))
			
			if is_on_wall():
				character_sprite.play("LEFT")
				_kill_movement()
	
	pass

func _selector():
	if Input.is_action_just_pressed("ui_up"):
		direction = Movement.UP
		speed = globals.player_speed
		character_sprite.play("UP")
	elif Input.is_action_just_pressed("ui_right"):
		direction = Movement.RIGHT
		speed = globals.player_speed
		character_sprite.play("RIGHT")
	elif Input.is_action_just_pressed("ui_down"):
		direction = Movement.DOWN
		speed = globals.player_speed
		character_sprite.play("RUN_DOWN")
	elif Input.is_action_just_pressed("ui_left"):
		direction = Movement.LEFT
		speed = globals.player_speed
		character_sprite.play("RUN_LEFT")
	pass

func go_dash():
	tween.interpolate_property(self,"position",position, position + (globals.get_vector(direction) * -32),0.05,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	if not direction == Movement.NONE:
		old_direction = direction
		tween.start()
		print("go tween")
		on_tween = true
	pass

func _kill_movement():
	direction = Movement.NONE
	is_dashing = false
	pass

func die():
	#Codigo de morir
	pass

func _on_Timer_timeout():
	is_dashing = false
	pass # replace with function body


func _on_Tween_tween_completed(object, key):
	on_tween = false
	direction = old_direction
	pass # replace with function body
