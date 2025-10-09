extends State

@onready var player: RigidBody2D = $"../.."
@onready var shield_recharge: Timer = %ShieldRecharge
@onready var shields: Node2D = %Shields



# Called when a state is first entered
# Precondition: 0 <= player.shield <= 2
func enter() -> void:
	print("Entered Reset Shield")
	print(shields.get_children()[player.shield - 1])
	shields.get_children()[player.shield].play("regen")
	player.shield += 1

	player.added_shield = false

	emit_signal("transition", self, "idle")
