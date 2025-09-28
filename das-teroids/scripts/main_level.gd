extends Node

@onready var score_timer: Timer = $ScoreKeeper/ScoreTimer
@onready var game_over: Label = $GameOver
@onready var asteroid_spawner: Node2D = $AsteroidSpawner


# Handles player death
func _on_player_death() -> void:
	asteroid_spawner.call_deferred("queue_free")
	score_timer.stop()
	game_over.size = get_viewport().size
	game_over.visible = true
