extends RigidBody2D

# Signal emitted when player dies
signal dead

const SPEED_SCALE = 10.0  # Scales the linear speed of player
const ROTATION_SPEED_SCALE = 0.1  # Scales the rotation speed of player
const PROJECTILE = preload("uid://ddoufa6s84qes")  # Projectile Scene

var can_attack: bool = true
@onready var view_size = get_viewport_rect().size


func _ready() -> void:
	# Set up signal handler for viewport size changing
	var viewport = get_viewport()
	viewport.connect("size_changed", _on_viewport_size_changed)


# Called once per frame
func _process(_delta: float) -> void:
	if Input.is_action_pressed("fire") and can_attack:
		fire()


func _physics_process(_delta: float) -> void:
	var player_rotation := Input.get_axis("ui_left", "ui_right")
	var y_direction := Input.get_axis("ui_up", "ui_down")

	angular_velocity += player_rotation * ROTATION_SPEED_SCALE
	linear_velocity += global_transform.y * y_direction * SPEED_SCALE

	# Wrap player position around current viewport size
	position = position.posmodv(view_size)


# Handle spawning projectile
func fire():
	# Start attack cooldown
	can_attack = false
	get_node("AttackCooldown").start()

	# Create projectile
	var proj = PROJECTILE.instantiate()
	get_parent().add_child(proj)

	# Assign starting position and rotation
	proj.position = self.position
	proj.rotation = self.rotation

	# Get player and projectile dimensions
	var player_size = get_node("CollisionShape2D").get_shape().get_rect().size
	var proj_size = proj.find_child("CollisionShape2D").get_shape().get_rect().size

	# Offset bullet spawn to spawn outside of player
	var rotated_pos = Vector2(
		sin(self.rotation) * ((player_size.x / 2) + (proj_size.x / 2)),
		-cos(self.rotation) * ((player_size.y / 2) + (proj_size.y / 2))
	)

	proj.position += rotated_pos


# Called on collision with asteroid
func hit() -> void:
	die()


# Called when player has died
func die() -> void:
	emit_signal("dead")
	call_deferred("queue_free")


# Called when player can attack again
func _on_attack_cooldown_timeout() -> void:
	can_attack = true


# Update view_size when the viewport changes size
func _on_viewport_size_changed() -> void:
	view_size = get_viewport_rect().size
