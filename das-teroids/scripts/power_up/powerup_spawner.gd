extends Node2D

const DAS_BLAST = preload("uid://drvdab6gc1cfq")
const CHAPPEL_CHOMP = preload("uid://botemo7ekakif")
const JENA_JUGGERNAUT = preload("uid://c6nx8u3qyeead")
const LAWLOR_LAG = preload("uid://7rr5innia2qy")
const SHWARTZ_SHOT = preload("uid://bmpiritw37k1o")

var view_size

func _ready() -> void:
	view_size = get_viewport_rect().size
	get_viewport().connect("size_changed", _on_viewport_size_change)

func _on_spawn_timer_timeout() -> void:
	print("Spawning Powerup")
	
	var instance
	match randi() % 5:
		0:
			instance = DAS_BLAST.instantiate()
		1:
			instance = CHAPPEL_CHOMP.instantiate()
		2:
			instance = JENA_JUGGERNAUT.instantiate()
		3:
			instance = LAWLOR_LAG.instantiate()
		4:
			instance = SHWARTZ_SHOT.instantiate()
	instance = LAWLOR_LAG.instantiate()
	
	# Start in the top left corner of the view
	var pos = Vector2(randi() % int(floor(view_size.x - (view_size.x / 10.0))), randi() % int(floor(view_size.y - (view_size.y / 10.0))))

	instance.position = pos

	add_child(instance)
	
func _on_viewport_size_change() -> void:
	view_size = get_viewport_rect().size
