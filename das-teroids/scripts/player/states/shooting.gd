extends State

const PROJECTILE = preload("uid://ddoufa6s84qes")  # Projectile Scene
@onready var reload_timer: Timer = %ReloadTimer
@onready var attack_cooldown: Timer = %AttackCooldown
@onready var player: RigidBody2D = $"../.."
@onready var collision_polygon_2d: CollisionPolygon2D = $"../../CollisionPolygon2D"


# Called when a state is first entered
func enter() -> void:
	print("Entered Shooting")

	player.mag -= 1

	if reload_timer.is_stopped():
		reload_timer.start()

	attack_cooldown.start()

	# Create projectile
	var proj = PROJECTILE.instantiate()
	get_parent().add_child(proj)

	# Assign starting position and rotation
	proj.position = player.position
	proj.rotation = player.rotation

	# Get player and projectile dimensions
	var player_size: Vector2 = collision_polygon_2d.get_polygon()[0]
	var proj_size: Vector2 = proj.find_child("CollisionShape2D").get_shape().get_rect().size

	# Offset bullet spawn to spawn outside of player
	var rotated_pos = Vector2(
		sin(player.rotation) * ((player_size.x) + (proj_size.x)),
		-cos(player.rotation) * ((player_size.y) + (proj_size.y))
	)

	proj.position += rotated_pos

	emit_signal("transition", self, "idle")
