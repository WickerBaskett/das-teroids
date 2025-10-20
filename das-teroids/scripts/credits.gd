extends Node2D

const MAIN_LEVEL = preload("uid://dhm28ne3u5nwa")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(MAIN_LEVEL)
