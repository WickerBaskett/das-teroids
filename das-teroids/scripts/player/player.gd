extends RigidBody2D

var dead: bool = false
@onready var view_size: Vector2 = get_viewport_rect().size
const mag_size: int = 3
var mag: int
var reload_time: float = 0
@onready var reload_timer: Timer = %ReloadTimer # Used in the UI


func _ready() -> void:
	mag = mag_size
	
	# Set up signal handler for viewport size changing
	var viewport = get_viewport()
	viewport.connect("size_changed", _on_viewport_size_changed)


# Called on collision with asteroid
func hit() -> void:
	dead = true


# Update view_size when the viewport changes size
func _on_viewport_size_changed() -> void:
	view_size = get_viewport_rect().size
