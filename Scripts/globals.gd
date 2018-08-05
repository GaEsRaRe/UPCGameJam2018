extends Node

const UP = Vector2(0,-1)
const RIGHT = Vector2(1,0)
const LEFT = Vector2(-1,0)
const DOWN = Vector2(0,1)

var player_speed = 700

var keys = {
	"key1" : false,
	"key2" : false
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