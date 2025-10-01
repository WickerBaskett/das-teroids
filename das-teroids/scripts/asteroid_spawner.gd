extends Node2D


@onready var spawn_timer: Timer = $SpawnTimer
var view: Rect2
var speed_mod: float = 1.0;
var spawn_mod: float = 0.8;

const ASTEROID = preload("uid://cj6wbc1rkkw3t")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	view = get_viewport_rect()


func _process(_delta: float) -> void:
	view = get_viewport_rect()

# Spawn an asteroid on the edge of the viewport with
# semi random angle 
func spawn_asteroid() -> void:
	var instance = ASTEROID.instantiate()

	##########################################
	#  Setup asteroid position and rotation  #
	##########################################

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
	add_child(instance)

#####################
#  Signal Handlers  #
#####################

# Spawn an asteroid on the edge of the viewport
func _on_timer_timeout() -> void:
	spawn_asteroid()


# Increase Difficulty
func _on_bump_difficutly_timeout() -> void:
	if randi() % 2 == 0:
		spawn_timer.wait_time *= spawn_mod
	else:
		speed_mod += 1
