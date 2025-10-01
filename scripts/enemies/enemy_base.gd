extends npc

@onready var sprite: Sprite2D = $Sprite2D





func _ready() -> void:
	super._ready()
	player = Global.game_world.player
	

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	pass


func _on_detection_radius_body_entered(body: Node2D) -> void:
	super._on_detection_radius_body_entered(body)
	if body is Player:
		is_hostile = true
		print("ldjfhldijfh")
		
	
	
	

func _on_detection_radius_body_exited(body: Node2D) -> void:
	super._on_detection_radius_body_exited(body)
	if body is Player:
		is_hostile = false
