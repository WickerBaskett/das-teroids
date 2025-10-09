extends Node

func _on_collectable_collected(player: RigidBody2D) -> void:
	print("Collected JJ")
	print(player.shield)
	if player.shield < 3:
		print("Added Shield")
		player.added_shield = true
	call_deferred("queue_free")
