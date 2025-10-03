extends State

@onready var asteroid_spawner: Node2D = $"../.."
@export var spawn_time: float
var elapsed: float

func enter() -> void:
	print("Entered idle")
	elapsed = spawn_time

func exit() -> void:
	pass
	
func physics_update(delta: float) -> void:
	pass

func process_update(delta: float) -> void:
	if elapsed < 0:
		emit_signal("transition", self, "spawning")
		return
	elapsed -= delta
