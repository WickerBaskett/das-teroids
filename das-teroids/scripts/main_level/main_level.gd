extends Node

var game_over_flag: bool = false

@onready var game_over: Label = $GameOver
@onready var valid_space: CollisionShape2D = $ValidSpace/CollisionShape2D


func _ready() -> void:
	SignalBus.connect("player_death", _on_player_death)
	get_viewport().connect("size_changed", _on_viewport_size_change)


#####################
#  Signal Handlers  #
#####################


# Handles player death
func _on_player_death() -> void:
	game_over_flag = true


func _on_viewport_size_change() -> void:
	var view_rect = valid_space.get_viewport_rect()
	valid_space.shape.size = view_rect.size
	valid_space.position = view_rect.size / 2


func _on_valid_space_area_exited(area: Area2D) -> void:
	area.call_deferred("queue_free")
