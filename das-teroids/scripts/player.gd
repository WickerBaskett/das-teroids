extends RigidBody2D

const SPEED_SCALE = 10.0
const ROTATION_SPEED_SCALE = 0.1


# This is the default movement function provided by CharacterBody2D
# This will be changed with the Player Controller ticket
func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var player_rotation := Input.get_axis("ui_left", "ui_right")
	var y_direction := Input.get_axis("ui_up", "ui_down")
	
	angular_velocity += player_rotation * ROTATION_SPEED_SCALE
	linear_velocity += global_transform.y * y_direction * SPEED_SCALE
		
	


# Called on collision with asteroid
func hit() -> void:
	call_deferred("queue_free")
