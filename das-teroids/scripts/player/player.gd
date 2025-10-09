extends RigidBody2D


@onready var view_size: Vector2 = get_viewport_rect().size
@onready var reload_timer: Timer = %ReloadTimer # Used in the UI
const mag_size: int = 3
var mag: int
var reload_time: float = 0
var collided: bool = false
var shield: int = true


func _ready() -> void:
	mag = mag_size
	
	# Set up signal handler for viewport size changing
	var viewport = get_viewport()
	viewport.connect("size_changed", _on_viewport_size_changed)


# Called on collision with asteroid
func hit() -> void:
	collided = true


# Update view_size when the viewport changes size
func _on_viewport_size_changed() -> void:
	view_size = get_viewport_rect().size
