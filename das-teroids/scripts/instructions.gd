extends Control

const MENU = preload("uid://dso7epbsx2cib")

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_packed(MENU)
