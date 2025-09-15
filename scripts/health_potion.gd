extends Area2D
class_name HealthPotion

# Healing properties
@export var heal_amount: int = 30
@export var auto_pickup: bool = true
@export var potion_type: String = "basic"
var potion_true

func _ready():
	potion_true = configure_potion_type()
	if potion_true:
		print("potion success")
	else:
		print("potion failure")
	print("Health Potion created - heals " + str(heal_amount) + " HP")
	# Connect the collision signal
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	# Check if it's the player
	if body is Player:
		print("Player found health potion!")
		
		# Try to heal the player (will work once they add heal method)
		if body.has_method("heal"):
			body.heal(heal_amount)
			print("Player healed for " + str(heal_amount) + " HP!")
			
			# Remove the potion after use
			if auto_pickup:
				$AnimationPlayer.play("disappear")
		else:
			print("Player doesn't have heal() method yet - coming in Lesson 2!")

func use_potion(player: Player):
	"""Alternative method for manual potion use"""
	if player.has_method("heal"):
		player.heal(heal_amount)
		$AnimationPlayer.play("disappear")
		return true
	return false

func configure_potion_type():
	match potion_type:
		"basic":
			heal_amount = 20
			return true
		"plus":
			heal_amount = 50
			return true
		"supreme":
			heal_amount = 100
			return true
		_:
			return false
	print(potion_type)
