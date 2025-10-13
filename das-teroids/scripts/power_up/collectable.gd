extends Area2D

signal collected(player: RigidBody2D)

var collected_flag: bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Players") and not collected_flag:
		collected_flag = true
		emit_signal("collected", body)
