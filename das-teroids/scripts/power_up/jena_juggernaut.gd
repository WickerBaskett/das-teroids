extends Node

func _on_collectable_collected(player: RigidBody2D) -> void:
	player.shield += 1
	print(player.shield)
	call_deferred("queue_free")
