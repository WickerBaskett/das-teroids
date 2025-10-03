extends Node
# This implementation is based heavily on work done in this video: 
#       https://www.youtube.com/watch?v=ow_Lum-Agbs

@export var initial_state: State

@onready var asteroid_spawner: Node2D = $".."
var states: Dictionary = {}
var current_state: State

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.connect("transitioned", on_transition)
	
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if current_state:
		current_state.process_update()
	
func _physics_process(_delta: float) -> void:
	if current_state:
		current_state.physics_update()

func on_transition(state, new_state_name) -> void:
	if state != current_state:
		return
		
	var new_state = states[new_state_name.to_lower()]
	if !new_state:
		return
	
	if current_state:
		current_state.exit()
		
	new_state.enter()
	
	current_state = new_state
