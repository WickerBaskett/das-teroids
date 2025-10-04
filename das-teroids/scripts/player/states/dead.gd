extends State

@onready var player: RigidBody2D = $"../.."


# Called when a state is first entered
func enter() -> void:
	print("Entered Dead")
	SignalBus.emit_signal("player_death")
	player.call_deferred("queue_free")
