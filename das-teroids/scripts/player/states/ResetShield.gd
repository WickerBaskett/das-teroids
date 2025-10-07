extends State

@onready var player: RigidBody2D = $"../.."
@onready var shield_recharge: Timer = %ShieldRecharge

# Called when a state is first entered
func enter() -> void:
	print("Entered Reset Shield")
	player.shield = true

	emit_signal("transition", self, "idle")
