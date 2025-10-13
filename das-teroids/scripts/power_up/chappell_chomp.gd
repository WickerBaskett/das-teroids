extends Node2D

@export var duration: float = 5.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var screen_effect: Control = %ScreenEffect

# Flag to determine wether this powerup is collected
var collected: bool = false

func _ready() -> void:
	print("Chappell Chomp Entered Scene")
	animated_sprite_2d.play("default")
	screen_effect.size = get_viewport_rect().size
	screen_effect.global_position = Vector2(0,0)

func _on_collectable_collected(player: RigidBody2D) -> void:
	if player.is_in_group("Players") and not collected:
		print("Collected Chappell Chomp")
		
		collected = true
		animated_sprite_2d.visible = false
		screen_effect.visible = true
		player.invincible = true
		
		await get_tree().create_timer(duration).timeout
		
		player.invincible = false
		
		print("Chappell Chomp is Over")
		
		call_deferred("queue_free")
