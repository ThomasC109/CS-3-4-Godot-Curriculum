extends Area2D
class_name pickup

@export var type: String
@export var label: String
@export var value: int

#func _ready() -> void: Doesn't work probably should just rename couldn't be bothered.
	#body_entered.connect(_on_body_entered)

func _ready():
	body_entered.connect(_on_body_entered)
	_configure_pickup(type)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _configure_pickup(type: String) -> bool:
	if type == "coin":
		match label:
			"copper":
				value = 5
				return true
			"silver":
				value = 25
				return true
			"gold":
				value = 100
				return true
			_:
				return false
	elif type == "potion":
		match label:
			"basic":
				value = 20
				return true
			"plus":
				value = 50
				return true
			"supreme":
				value = 100
				return true
			_:
				return false
	else:
		return 0

func _on_body_entered(body):
	if body is Player:
		body.collect_pickup(type,label,value)
