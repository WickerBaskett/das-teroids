extends State
@onready var score_timer: Timer = $"../../ScoreKeeper/ScoreTimer"

@onready var game_over: BoxContainer = %GameOver


# Called when a state is first entered
func enter() -> void:
	score_timer.stop()
	game_over.size = game_over.get_viewport_rect().size
	game_over.visible = true
