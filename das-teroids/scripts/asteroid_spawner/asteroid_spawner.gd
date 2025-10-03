extends Node2D

var view: Rect2

func _ready() -> void:
	view = get_viewport_rect()
	get_viewport().connect("size_changed", _on_viewport_size_changed)

#####################
#  Signal Handlers  #
#####################

func _on_viewport_size_changed() -> void:
	view = get_viewport_rect()
