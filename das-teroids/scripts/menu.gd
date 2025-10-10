extends Control

const MAIN_LEVEL = preload("uid://dhm28ne3u5nwa")

@onready var box_cont: BoxContainer = $BoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_viewport().connect("size_changed", _on_viewport_size_changed)


#####################
#  Signal Handlers  #
#####################


func _on_viewport_size_changed() -> void:
	var view_size = get_viewport_rect().size
	box_cont.size = view_size


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(MAIN_LEVEL)
