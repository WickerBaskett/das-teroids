extends Node2D

# Amount to slow time by, base speed is 1.0
@export var time_scale: float = 0.25

# Time in seconds the powerup lasts
@export var duration: float = 5.0

@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var screen_effect: Control = %ScreenEffect
@onready var shader_rect: ColorRect = %ShaderRect


func _ready() -> void:
	screen_effect.size = get_viewport_rect().size
	screen_effect.global_position = Vector2(0,0)

func _on_collectable_collected(_player: RigidBody2D) -> void:
	
	sprite_2d.visible = false
	screen_effect.visible = true
	if shader_rect.material is ShaderMaterial:
		print("Updating Shader parameters")
		shader_rect.material.set_shader_parameter("effect_origin", position / get_viewport_rect().size)
		shader_rect.material.set_shader_parameter("start_time", Time.get_ticks_msec() / 1000.0)
	
	var old_time_scale: float = Engine.get_time_scale()
	Engine.set_time_scale(time_scale)
	
	await get_tree().create_timer(duration * time_scale).timeout
	
	Engine.set_time_scale(old_time_scale)
	
	call_deferred("queue_free")
