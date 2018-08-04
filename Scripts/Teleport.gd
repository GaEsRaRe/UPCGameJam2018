extends Area2D

export var map_code_level = 0
export var map_code_sub_level = 0
var address

func _ready():
	address = str("res://Scenes/",map_code_level,"-",map_code_sub_level,".tscn")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass




func _on_Teleport_body_entered(body):
	print("Hey!")
	if body.is_in_group("Player"):
		print("is here!")
		get_tree().change_scene(address)
	pass # replace with function body
