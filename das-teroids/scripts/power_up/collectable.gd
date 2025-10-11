extends Area2D

signal collected(player: RigidBody2D)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Players"):
		emit_signal("collected", body)
