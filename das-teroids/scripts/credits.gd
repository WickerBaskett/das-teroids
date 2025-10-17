extends Node2D

const MENU = preload("res://scenes/main_level.tscn")

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(MENU)
