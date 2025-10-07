extends State

@onready var player: RigidBody2D = $"../.."
@onready var shield_recharge: Timer = %ShieldRecharge
@onready var shield: AnimatedSprite2D = %Shield

# Called when a state is first entered
func enter() -> void:
	print("Entered Reset Shield")
	player.shield = true
	shield.play("regen")

	emit_signal("transition", self, "idle")
