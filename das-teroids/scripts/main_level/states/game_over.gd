extends State

@onready var asteroid_spawner: Node2D = %AsteroidSpawner


# Called when a state is first entered
func enter() -> void:
	print("Enter Game Over")
	asteroid_spawner.call_deferred("queue_free")
