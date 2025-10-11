extends State

@onready var reload_timer: Timer = %ReloadTimer
@onready var attack_cooldown: Timer = $"../../AttackCooldown"
@onready var player: RigidBody2D = $"../.."
@onready var shield_recharge: Timer = %ShieldRecharge


# Called from physics_process(delta: float)
func physics_update(_delta: float) -> void:
	if Input.get_axis("left", "right") != 0 or Input.get_axis("up", "down") != 0:
		emit_signal("transition", self, "moving")

		# Wrap player position around current viewport size
	player.position = player.position.posmodv(player.view_size)


# Called from process(delta: float)
func process_update(_delta: float) -> void:
	if player.collided:
		emit_signal("transition", self, "damaged")

	print(shield_recharge.time_left)
	if shield_recharge.time_left == 0 and player.shield == false:
		emit_signal("transition", self, "resetshield")

	if reload_timer.time_left == 0 and player.mag < player.MAG_SIZE:
		emit_signal("transition", self, "reload")

	if Input.is_action_pressed("fire") and attack_cooldown.time_left == 0.0 and player.mag > 0:
		emit_signal("transition", self, "shooting")
