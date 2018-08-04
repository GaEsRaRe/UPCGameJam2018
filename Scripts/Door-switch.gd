extends Node2D

onready var door = get_node("Door")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_switch_body_entered(body):
	if body.is_in_group("Player") or body.is_in_group("Box"):
		pass
	pass # replace with function body
