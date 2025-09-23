extends Node
class_name npc

@onready var player: Player = $Player

@export var dialogue: Array[String] = []
@export var inventory: Array[String] = []
@export var speed: int = 200
@export var health:int = 100
@export var type: String
@export var is_hostile: bool = false
#drop item something
@export var drop_rate: float = 10
@export var state: String
@export var move_points: Array[Vector2] = []
@export var damage: int = 1

func _process(delta):
	print(player)

#func movement():
	#if is_hostile:
		 #
	#else:
		##move toward next move point
