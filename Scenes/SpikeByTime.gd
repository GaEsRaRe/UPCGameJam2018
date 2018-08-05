extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var timeEnabled = 0
export var timeDisabled = 0
onready var timer = get_node("Timer")
onready var faseTimer = get_node("faseTimer")
onready var sprite = get_node("Sprite")

var isEnabled = true
var disabledTexture = preload("res://Sprites/SimpleSprite.png")
var enabledTexture = preload("res://spikes.png")

func _ready():
	timer.wait_time = timeEnabled
	faseTimer.wait_time = timeDisabled
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Timer_timeout():
	sprite.texture = disabledTexture
	isEnabled = not isEnabled
	faseTimer.wait_time = timeDisabled
	faseTimer.start()
	pass # replace with function body


func _on_faseTimer_timeout():
	sprite.texture = enabledTexture
	isEnabled = not isEnabled
	timer.wait_time = timeEnabled
	timer.start()
	pass # replace with function body


func _on_SpikeByTime_body_entered(body):
	if body.is_in_group("Player") and isEnabled:
		get_tree().reload_current_scene()
	pass # replace with function body
