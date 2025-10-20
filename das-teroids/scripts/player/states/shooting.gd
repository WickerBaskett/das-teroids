extends State

const PROJECTILE = preload("uid://ddoufa6s84qes")  # Projectile Scene
@onready var reload_timer: Timer = %ReloadTimer
@onready var attack_cooldown: Timer = %AttackCooldown
@onready var player: RigidBody2D = $"../.."
@onready var collision_polygon_2d: CollisionPolygon2D = $"../../CollisionPolygon2D"
@onready var shoot_audio: Node2D = %"Player Audio/Fire Audio"


# Spawn a projectile offset radians from directly in front of the player
func spawn_proj(offset: float = 0.0) -> void:
	# Create projectile
	var proj = PROJECTILE.instantiate()
	get_parent().add_child(proj)

	# Assign starting position and rotation
	proj.position = player.position
	proj.rotation = player.rotation + offset

	# Get player and projectile dimensions
	var player_size: Vector2 = collision_polygon_2d.get_polygon()[0]
	var proj_size: Vector2 = proj.find_child("CollisionShape2D").get_shape().get_rect().size

	# Offset bullet spawn to spawn outside of player
	var rotated_pos = Vector2(
		sin(player.rotation) * ((player_size.x) + (proj_size.x)),
		-cos(player.rotation) * ((player_size.y) + (proj_size.y))
	)
	shoot_audio.play(0.0)  # plays
	proj.position += rotated_pos


# Called when a state is first entered
func enter() -> void:
	
	var bullet_offset: Array
	if not player.infinite_ammo:
		player.mag -= 1

		if reload_timer.is_stopped():
			reload_timer.start()

		bullet_offset = range(0, 1)
	else:
		bullet_offset = range(-1, 2)

	attack_cooldown.start()

	for i in bullet_offset:
		spawn_proj(i * player.accuracy_sway / 2)

	emit_signal("transition", self, "idle")
