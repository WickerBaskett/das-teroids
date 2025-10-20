extends Control

const MENU = "res://scenes/levels/menu.tscn"


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file(MENU)
