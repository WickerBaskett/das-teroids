extends Node2D

var score: int = 0

@onready var score_label = $ScoreLabel
@onready var score_timer = $ScoreTimer


func _ready() -> void:
	score_timer.start()


# Increment score and update
func update_score() -> void:
	score += 1
	score_label.text = "SCORE: " + str(score)


func _on_score_timer_timeout() -> void:
	update_score()
