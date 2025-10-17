extends Node2D

# Normal game timescale
const DEFAULT_TIME_SCALE: float = 1.0

# Amount to slow time by, base speed is DEFAULT_TIME_SCALE
@export var time_scale: float = 0.25

# Time in seconds the powerup lasts
@export var duration: float = 5.0

# Tracks if this is the most recently activated lawlor lag
var most_recent: bool = true

@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var screen_effect: Control = %ScreenEffect
@onready var shader_rect: ColorRect = %ShaderRect
@onready var duration_timer: Timer = %Duration


func _ready() -> void:
	SignalBus.connect("lawlor_lag_activate", _lose_precedence)
	duration_timer.set_wait_time(duration * time_scale)


func _process(_delta: float) -> void:
	shader_rect.material.set_shader_parameter(
		"elapsed_time", (duration * time_scale) - duration_timer.time_left
	)


func _on_collectable_collected(_player: RigidBody2D) -> void:
	SignalBus.emit_signal("lawlor_lag_activate", self)

	most_recent = true
	scale = Vector2(1.0, 1.0)
	sprite_2d.visible = false

	screen_effect.size = get_viewport_rect().size
	screen_effect.visible = true

	if shader_rect.material is ShaderMaterial:
		shader_rect.material.set_shader_parameter(
			"effect_origin", global_position / screen_effect.size
		)

	duration_timer.start()

	Engine.set_time_scale(time_scale)

	await duration_timer.timeout

	if most_recent:
		Engine.set_time_scale(DEFAULT_TIME_SCALE)

	call_deferred("queue_free")


func _lose_precedence(source: Node2D) -> void:
	if self != source:
		most_recent = false
