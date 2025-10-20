extends State

@onready var asteroid_spawner: Node2D = %AsteroidSpawner
@onready var powerup_spawner: Node2D = %PowerupSpawner


# Called when a state is first entered
func enter() -> void:
	print("Enter Game Over")
	asteroid_spawner.call_deferred("queue_free")
	powerup_spawner.call_deferred("queue_free")
