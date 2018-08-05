extends VBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var slot1 = get_node("Slot1/Key")
onready var slot2 = get_node("Slot2/Key")
onready var slot3 = get_node("Slot3/Key")

var bool1 = false
var bool2 = false
var bool3 = false

func _ready():
	if bool1 == false:
		if (globals.keys["key1"]):
			bool1 = true
			slot1.texture = globals.key1
	if bool2 == false:
		if (globals.keys["key2"]):
			bool2 = true
			slot2.texture = globals.key2
	if bool3 == false:
		if (globals.keys["key3"]):
			bool3 = true
			slot3.texture = globals.key2
	pass

func _process(delta):
	if bool1 == false:
		if (globals.keys["key1"]):
			bool1 = true
			slot1.texture = globals.key1
	if bool2 == false:
		if (globals.keys["key2"]):
			bool2 = true
			slot2.texture = globals.key2
	if bool3 == false:
		if (globals.keys["key3"]):
			bool3 = true
			slot3.texture = globals.key2
	pass
