# This next line allows the color of the coin to update without running the game
# It can mostly be ignored, but it must be the first line of the script
@tool

extends Area2D
class_name coin

@export var color: Color
@export var goldAmount: int = 10
@export var autoPickup: bool = true
@export var coin_type: String = "copper"
var coin_true

func _ready():
	print(goldAmount)
	coin_true = configure_coin_type()
	if coin_true:
		print("success")
	else:
		print("failure")
	body_entered.connect(_on_body_entered)


func _process(delta: float) -> void:
	# Set the color of the coin
	$AnimatedSprite2D.material.set_shader_parameter("color", color)

func _on_body_entered(body):
	if body is Player:
		if autoPickup:
			$AnimatedSprite2D.play("disappear")
		print("Wow, you found a coin!")
		if body.has_method("coin"):
			body.coin(goldAmount)
		
		else:
			print("This method doesn't exist yet")
		print("Player got " + str(goldAmount) + " coins!")


func configure_coin_type():
	match coin_type:
		"copper":
			goldAmount = 5
			return true
		"silver":
			goldAmount = 25
			return true
		"gold":
			goldAmount = 100
			return true
		_:
			return false
	print(coin_type)

func collect_coin(player: Player):
	if player.has_method("coin"):
		player.coin(goldAmount)
		$AnimatedSprite2D.play("disappear")
		return true
	else:
		return false
