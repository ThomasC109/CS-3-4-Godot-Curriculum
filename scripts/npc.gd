extends CharacterBody2D
class_name npc

@onready var player = get_parent().get_parent().get_parent().get_node("Player")

@export var dialogue: Array[String] = []
@export var inventory: Array[String] = []
@export var speed: int = 200
@export var health:int = 100
@export var type: String
@export var is_hostile: bool = false
var point = 0
@export var drop_rate: float = 10
@export var state: String
@export var move_points: Array[Vector2] = []
@export var damage: int = 1

func _physics_process(delta):
	movement()
	move_and_slide()


func movement():
	var target
	print(position.distance_to(player.position))
	print(player.position)
	if is_hostile:
		target = player.position
	else:
		target = move_points[point]
		
	var target_direction = position.direction_to(target)
	velocity = target_direction * speed
	if position.distance_to(target) < 5:
		point += 1
		if point > 3:
			point = 0
