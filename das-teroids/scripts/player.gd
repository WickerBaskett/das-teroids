extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const PROJECTILE = preload("uid://ddoufa6s84qes")

var can_attack: bool = true


# Called once per frame
func _process(_delta: float) -> void:
	if Input.is_action_pressed("fire") and can_attack:
		fire()


# This is the default movement function provided by CharacterBody2D
# This will be changed with the Player Controller ticket
func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction := Input.get_axis("ui_left", "ui_right")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var y_direction := Input.get_axis("ui_up", "ui_down")
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()


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
	call_deferred("queue_free")


# Called when player can attack again
func _on_attack_cooldown_timeout() -> void:
	can_attack = true
