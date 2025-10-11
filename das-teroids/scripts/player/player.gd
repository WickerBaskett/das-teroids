extends RigidBody2D

@onready var view_size: Vector2 = get_viewport_rect().size

# This is used in the UI
@onready var reload_timer: Timer = %ReloadTimer 

#######################
#  Player Statistics  #
#######################

# Max number of bullets the player can have
const MAG_SIZE: int = 3

# Number of bullets the player currently has
var mag: int

# Number of shields the player currently has
var shield: int = true

###########
#  Flags  #
###########

# Set when the player is hit
var collided: bool = false

# Set on collection of Jena Juggernaut Power Up
var added_shield: bool = false

# Set on collection of Chappell Chomp Power Up
var invincible: bool = false

# Set on player death
var dead: bool = false

######################
#  Player Functions  #
######################

func _ready() -> void:
	mag = MAG_SIZE
	# Set up signal handler for viewport size changing
	var viewport = get_viewport()
	viewport.connect("size_changed", _on_viewport_size_changed)


# Called on collision with asteroid
func hit() -> void:
	collided = true


# Update view_size when the viewport changes size
func _on_viewport_size_changed() -> void:
	pass
	view_size = get_viewport_rect().size
