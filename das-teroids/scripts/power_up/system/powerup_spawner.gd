extends Node2D

const POWERUP = preload("uid://80nqkajvadrc")

var view_size


func _ready() -> void:
	view_size = get_viewport_rect().size
	get_viewport().connect("size_changed", _on_viewport_size_change)


func _on_spawn_timer_timeout() -> void:
	var powerup: Node2D = POWERUP.instantiate()

	##########################################
	#  Setup powerup position and rotation  #
	##########################################
	var view = get_viewport_rect()

	# Start in the top left corner of the view
	var pos = Vector2(view.position.x, view.position.y)

	# Add some offset to rotation
	var rot = randf() - 0.5

	# Pixels past the edge of the screen asteroids will spawn
	var screen_offset = 100

	match randi() % 4:
		0:  # Top Edge
			pos.x += randf() * view.size.x
			pos.y -= screen_offset
			rot += 0
		1:  # Bottom Edge
			pos.x += randf() * view.size.x
			pos.y += view.size.y + screen_offset
			rot += PI
		2:  # Left Edge
			pos.y += randf() * view.size.y
			pos.x -= screen_offset
			rot += 3 * PI / 2
		3:  # Right Edge
			pos.y += randf() * view.size.y
			pos.x += view.size.x + screen_offset
			rot += PI / 2

	# Apply changes to instance'
	powerup.set_position(pos)
	powerup.set_rotation(rot)

	add_child(powerup)


func _on_viewport_size_change() -> void:
	view_size = get_viewport_rect().size
