extends State

const PROJECTILE = preload("uid://ddoufa6s84qes")  # Projectile Scene
@onready var attack_cooldown: Timer = %AttackCooldown
@onready var player: RigidBody2D = $"../.."
@onready var collision_polygon_2d: CollisionPolygon2D = $"../../CollisionPolygon2D"


# Called when a state is first entered
func enter() -> void:
	print("Entered Shooting")
	
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
	
	##########################
	#  Determine Next State  #
	##########################
	
	if player.dead:
		emit_signal("transition", self, "dead")
	
	if (
		Input.get_axis("left", "right") != 0
		or Input.get_axis("up", "down") != 0
	):
		emit_signal("transition", self, "moving")
	
	emit_signal("transition", self, "idle")


# Called when a state is exited
func exit() -> void:
	pass


# Called from physics_process(delta: float)
func physics_update(_delta: float) -> void:
	pass


# Called from process(delta: float)
func process_update(_delta: float) -> void:
	pass
