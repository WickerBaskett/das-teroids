extends State

@onready var difficulty_timer: Timer = $"../../DifficultyTimer"
@onready var spawn_timer: Timer = $"../../SpawnTimer"

func process_update(_delta: float) -> void:
	if spawn_timer.time_left == 0:
		emit_signal("transition", self, "spawning")
		return
	
	if difficulty_timer.time_left == 0:
		emit_signal("transition", self, "increasedifficulty")
		
