extends State

@onready var player: RigidBody2D = $"../.."
@onready var reload_timer: Timer = %ReloadTimer


# Called when a state is first entered
func enter() -> void:
	player.mag += 1

	if player.mag < player.MAG_SIZE:
		reload_timer.start()

	emit_signal("transition", self, "idle")
