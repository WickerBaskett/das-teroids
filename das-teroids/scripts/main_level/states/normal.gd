extends State

@onready var main_level: Node2D = $"../.."


# Called from process(delta: float)
func process_update(_delta: float) -> void:
	if main_level.game_over_flag:
		emit_signal("transition", self, "gameover")
