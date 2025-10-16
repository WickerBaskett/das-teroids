extends Node

func _on_collectable_collected(player: RigidBody2D) -> void:
	if player.shield < 3:
		player.added_shield = true
	call_deferred("queue_free")
