extends Node
class_name pickup

var type: String
var color: Color
var autoPickup: bool
var value: int

#func _ready() -> void: Doesn't work probably should just rename couldn't be bothered.
	#body_entered.connect(_on_body_entered)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _configure_pickup(_name: String) -> bool:
	if _name == "coin":
		return 1
	elif _name == "potion":
		return 1
	else:
		return 0

func _on_body_entered(body):
	if body is Player:
		print("thats a player")
