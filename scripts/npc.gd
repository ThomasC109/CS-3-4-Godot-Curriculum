extends CharacterBody2D
class_name npc

@onready var player: Player = $Player

@export var dialogue: Array[String] = []
@export var inventory: Array[String] = []
@export var speed: int = 20
@export var health:int = 100
@export var type: String
@export var is_hostile: bool = false
var point = 1
var p_position = position
@export var drop_rate: float = 10
@export var state: String
@export var move_points: Array[Vector2] = []
@export var damage: int = 1

func _process(delta):
	movement()


func movement():
	if is_hostile:
		velocity = move_points[point] * speed
		print()
		if abs(move_points[point].x-position.x) < 50 or abs(move_points[point].y-position.y) < 50:
			if point <= 2:
				point += 1
			else:
				point = 0
	move_and_slide()
	p_position = position
