extends Node

@onready var score_timer: Timer = $ScoreKeeper/ScoreTimer


# Handles player death
func _on_player_death() -> void:
	score_timer.stop()
