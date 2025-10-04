extends State


@onready var player: RigidBody2D = $"../.."
@onready var attack_cooldown: Timer = %AttackCooldown

const SPEED_SCALE = 10.0  # Scales the linear speed of player
const ROTATION_SPEED_SCALE = 0.1  # Scales the rotation speed of player

# Called when a state is first entered
func enter() -> void:
	print("Entered Moving")


# Called when a state is exited
func exit() -> void:
	pass


# Called from physics_process(delta: float)
func physics_update(_delta: float) -> void:
	var player_rotation := Input.get_axis("ui_left", "ui_right")
	var y_direction := Input.get_axis("ui_up", "ui_down")
	
	if player_rotation == 0 or y_direction == 0:
		emit_signal("transition", self, "idle")

	player.angular_velocity += player_rotation * ROTATION_SPEED_SCALE
	player.linear_velocity += player.global_transform.y * y_direction * SPEED_SCALE

	# Wrap player position around current viewport size
	player.position = player.position.posmodv(player.view_size)
	


# Called from process(delta: float)
func process_update(_delta: float) -> void:
	if player.dead:
		emit_signal("transition", self, "dead")
		
	if Input.is_action_pressed("fire") and attack_cooldown.time_left == 0.0:
		emit_signal("transition", self, "shooting")
