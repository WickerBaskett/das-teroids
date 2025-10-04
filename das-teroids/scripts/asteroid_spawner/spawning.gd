extends State

const ASTEROID = preload("uid://cj6wbc1rkkw3t")

@export var speed_mod: float

@onready var asteroid_spawner: Node2D = $"../.."
@onready var spawn_timer: Timer = $"../../SpawnTimer"


func enter() -> void:
	var instance = ASTEROID.instantiate()

	##########################################
	#  Setup asteroid position and rotation  #
	##########################################
	var view = asteroid_spawner.get_viewport_rect()

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
	instance.speed *= speed_mod
	instance.position = pos
	instance.set_rotation(rot)

	# This feels weird, asteroids maybe shouldnt be children of
	# the spawning state? They are still grandchildren of the
	# asteroid spawner but it feels a little weird
	add_child(instance)

	spawn_timer.start()

	emit_signal("transition", self, "idle")
