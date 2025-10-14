extends Node2D

# Duration in seconds of powerup
@export var duration: float = 5.0
@onready var sprite_2d: Sprite2D = %Sprite2D

func _on_collectable_collected(player: RigidBody2D) -> void:
	
	sprite_2d.visible = false
	player.infinite_ammo = true
	
	if player.mag < 1:
		player.mag = 1
	
	await get_tree().create_timer(duration).timeout
	
	player.infinite_ammo = false
	
	call_deferred("queue_free")
	
	
