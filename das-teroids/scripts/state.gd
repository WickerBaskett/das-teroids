extends Node
class_name State
# This implementation is based heavily on work done in this video: 
#       https://www.youtube.com/watch?v=ow_Lum-Agbs

signal transition(state, new_state_name)

func enter() -> void:
	pass

func exit() -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func process_update(delta: float) -> void:
	pass 
