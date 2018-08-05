extends KinematicBody2D

export var direction = Vector2(1,0)
onready var tween = get_node("Tween")
export var state = false
export var distance = 100

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func move():
	print("ready")
	tween.interpolate_property(self,"transform/pos",position, position + (distance * direction),1,Tween.TRANS_SINE,Tween.EASE_OUT)
	tween.start()
	pass