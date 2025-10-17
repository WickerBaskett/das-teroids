extends Node2D

# Duration in seconds of powerup
@export var duration: float = 5.0
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D


func _ready() -> void:
	animated_sprite_2d.play("idle")

func _on_collectable_collected(player: RigidBody2D) -> void:
	animated_sprite_2d.visible = false
	player.infinite_ammo = true
	scale = Vector2(1.0,1.0)

	if player.mag < 1:
		player.mag = 1

	await get_tree().create_timer(duration).timeout

	player.infinite_ammo = false

	call_deferred("queue_free")
