extends State

@onready var player: RigidBody2D = $"../.."
@onready var shield_recharge: Timer = %ShieldRecharge
@onready var shields: Node2D = %Shields



# Called when a state is first entered
# Precondition: 0 <= player.shield <= 2
func enter() -> void:
	if player.added_shield and player.shield == 0:
		restore_shield()

	restore_shield()

	player.added_shield = false

	emit_signal("transition", self, "idle")

func restore_shield() -> void:
	shields.get_children()[player.shield].play("regen")
	player.shield += 1
