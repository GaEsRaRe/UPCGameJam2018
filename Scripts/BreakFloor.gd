extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var broken = false
onready var sprite = get_node("AnimatedSprite")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass



func _on_BreakFloor_body_entered(body):
	if body.is_in_group("Player"):
		if body.is_dashing and broken == false:
			pass
		else:
			sprite.play("unsafe")
			print("Dead!")
	pass # replace with function body


func _on_BreakFloor_body_exited(body):
	if body.is_in_group("Player"):
		broken = true
		sprite.play("unsafe")
	pass # replace with function body
