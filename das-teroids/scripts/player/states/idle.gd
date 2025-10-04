extends State

@onready var attack_cooldown: Timer = $"../../AttackCooldown"
@onready var player: RigidBody2D = $"../.."


# Called from physics_process(delta: float)
func physics_update(_delta: float) -> void:
	if (
		Input.get_axis("left", "right") != 0
		or Input.get_axis("up", "down") != 0
	):
		emit_signal("transition", self, "moving")


# Called from process(delta: float)
func process_update(_delta: float) -> void:
	if player.dead:
		emit_signal("transition", self, "dead")

	if Input.is_action_pressed("fire") and attack_cooldown.time_left == 0.0:
		emit_signal("transition", self, "shooting")
