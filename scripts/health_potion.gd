extends pickup
class_name HealthPotion

func _on_body_entered(body):
	super._on_body_entered(body)
	$AnimationPlayer.play("disappear")
	print($AnimationPLayer)
