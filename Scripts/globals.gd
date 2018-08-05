extends Node

const UP = Vector2(0,-1)
const RIGHT = Vector2(1,0)
const LEFT = Vector2(-1,0)
const DOWN = Vector2(0,1)

var key1 = preload("res://key1.png")
var key2 = preload("res://key2.png")
var key3 = preload("res://key3.png")

var player_speed = 700


var keys = {
	"key1" : false,
	"key2" : false,
	"key3" : false
}


enum Movement{NONE,A,B,C,D}

func get_vector(dir):
	match dir:
		Movement.A:
			return UP
		Movement.C:
			return DOWN
		Movement.D:
			return LEFT
		Movement.B:
			return RIGHT
	return Vector2(0,0)