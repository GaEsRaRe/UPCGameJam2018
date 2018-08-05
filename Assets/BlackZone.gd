extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

onready var bzAnim = get_node("AnimationPlayer")

func _ready():
	get_node("BlackZoneSprite").modulate.a = 255
	pass




func _on_BlackZone_body_entered(body):
	if body.is_in_group("Player"):
		bzAnim.play("fadeInBlackZone")
	pass # replace with function body


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fadeInBlackZone":
		queue_free()
	pass # replace with function body
