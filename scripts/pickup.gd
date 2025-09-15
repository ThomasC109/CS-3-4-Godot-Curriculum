extends Node
class_name pickup

var type: String
var color: Color
var autoPickup: bool
var value: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
