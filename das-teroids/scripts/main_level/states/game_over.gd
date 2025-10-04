extends State

@onready var asteroid_spawner: Node2D = %AsteroidSpawner
@onready var score_timer: Timer = $"../../ScoreKeeper/ScoreTimer"
@onready var game_over: Label = %GameOver

# Called when a state is first entered
func enter() -> void:
	print("Enter Game Over")
	asteroid_spawner.call_deferred("queue_free")
	score_timer.stop()
	game_over.size = get_viewport().size
	game_over.visible = true
