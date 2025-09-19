# This next line allows the color of the coin to update without running the game
# It can mostly be ignored, but it must be the first line of the script
@tool

extends pickup
class_name coin

@export var color: Color

func _process(delta: float) -> void:
	$AnimatedSprite2D.material.set_shader_parameter("color", color)

func _on_body_entered(body):
	super._on_body_entered(body)
	$AnimatedSprite2D.play("disappear")
