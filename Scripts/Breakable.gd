extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
enum Movement{NONE,UP,RIGHT,DOWN,LEFT}
onready var colly = get_node("Body")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass



func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		if body.is_dashing == true:
			if body.direction == Movement.LEFT or body.direction == Movement.RIGHT:
				print("Hey!")
				queue_free()
	pass # replace with function body


func _on_Vertical_body_entered(body):
	if body.is_in_group("Player"):
		colly.dissable = body.is_dashing
		if body.is_dashing:
			colly.disable = true
			if body.direction == Movement.UP or body.direction == Movement.DOWN:
				queue_free()
	pass # replace with function body
