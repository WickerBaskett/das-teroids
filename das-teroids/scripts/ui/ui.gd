extends Control

@export var player: RigidBody2D

var game_over_flag: bool = false

func _ready() -> void:
	SignalBus.connect("player_death", _on_player_death)


func _on_player_death() -> void:
	game_over_flag = true
