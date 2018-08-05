extends StaticBody2D

enum Movement{NONE,UP,RIGHT,DOWN,LEFT}
onready var colly = get_node("Body")

func _ready():
	set_physics_process(true)
	pass

func _physics_process(delta):
	
	pass

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		if body.is_dashing:
			if body.direction == Movement.LEFT or body.direction == Movement.RIGHT:
				colly.disabled = true
				body.is_dashing = false
				queue_free()
	pass # replace with function body


func _on_Vertical_body_entered(body):
	if body.is_in_group("Player"):
		if body.is_dashing:
			if body.direction == Movement.UP or body.direction == Movement.DOWN:
				colly.disabled = true
				body.is_dashing = false
				queue_free()
	pass # replace with function body
