extends RigidBody2D


@onready var view_size: Vector2 = get_viewport_rect().size

######################
#  Reload Variables  #
######################

@onready var reload_timer: Timer = %ReloadTimer # Used in the UI
const mag_size: int = 3
var mag: int
#var reload_time: float = 0

# Number of shields the player currently has
var shield: int = true

###########
#  Flags  #
###########

# Set when the player is hit
var collided: bool = false

# Set on collection of Jena Juggernaut Power Up
var added_shield: bool = false


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
