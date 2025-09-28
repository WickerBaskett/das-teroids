extends RigidBody2D

# Scales the linear speed of player
const SPEED_SCALE = 10.0
# Scales the rotation speed of player
const ROTATION_SPEED_SCALE = 0.1


func _physics_process(_delta: float) -> void:
	var player_rotation := Input.get_axis("ui_left", "ui_right")
	var y_direction := Input.get_axis("ui_up", "ui_down")

	angular_velocity += player_rotation * ROTATION_SPEED_SCALE
	linear_velocity += global_transform.y * y_direction * SPEED_SCALE


# Called on collision with asteroid
func hit() -> void:
	call_deferred("queue_free")
