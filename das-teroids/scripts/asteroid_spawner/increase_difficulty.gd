extends State

@export var spawn_mod: float = 0.8

@onready var difficulty_timer: Timer = $"../../DifficultyTimer"
@onready var spawn_timer: Timer = $"../../SpawnTimer"
@onready var spawning: Node = $"../Spawning"


func enter() -> void:
	if randi() % 2 == 0:
		spawning.speed_mod += 1
	else:
		spawn_timer.wait_time *= spawn_mod

	difficulty_timer.start()

	emit_signal("transition", self, "idle")
