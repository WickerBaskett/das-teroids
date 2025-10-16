extends Node2D

@export var duration: float = 5.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var screen_effect: Control = %ScreenEffect


func _ready() -> void:
	animated_sprite_2d.play("default")


func _on_collectable_collected(player: RigidBody2D) -> void:
	if player.is_in_group("Players"):
		animated_sprite_2d.visible = false
		screen_effect.visible = true
		player.invincible = true

		screen_effect.size = get_viewport_rect().size

		await get_tree().create_timer(duration).timeout

		player.invincible = false

		call_deferred("queue_free")
