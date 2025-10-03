extends Node

@onready var score_timer: Timer = $ScoreKeeper/ScoreTimer
@onready var game_over: Label = $GameOver
@onready var asteroid_spawner: Node2D = $AsteroidSpawner
@onready var valid_space: CollisionShape2D = $ValidSpace/CollisionShape2D


func _ready() -> void:
	get_viewport().connect("size_changed", _on_viewport_size_change)


#####################
#  Signal Handlers  #
#####################


# Handles player death
func _on_player_death() -> void:
	asteroid_spawner.call_deferred("queue_free")
	score_timer.stop()
	game_over.size = get_viewport().size
	game_over.visible = true


func _on_viewport_size_change() -> void:
	print("Resizing valid space")
	var view_rect = valid_space.get_viewport_rect()
	valid_space.shape.size = view_rect.size
	valid_space.position = view_rect.size / 2


func _on_valid_space_area_exited(area: Area2D) -> void:
	print("Deleting area: " + str(area))
	area.call_deferred("queue_free")
