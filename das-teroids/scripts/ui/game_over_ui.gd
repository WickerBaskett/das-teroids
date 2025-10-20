extends BoxContainer

const MAIN_LEVEL = preload("uid://dhm28ne3u5nwa")
const MENU = "uid://dso7epbsx2cib"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_viewport().connect("size_changed", _on_viewport_size_changed)


#####################
#  Signal Handlers  #
#####################


func _on_viewport_size_changed() -> void:
	var view_size = get_viewport_rect().size
	self.size = view_size

func _on_menu_button_pressed() -> void:
	print("test")
	get_tree().change_scene_to_file(MENU)


func _on_restart_button_pressed() -> void:
	print("test")
	visible = false
	get_tree().reload_current_scene()
