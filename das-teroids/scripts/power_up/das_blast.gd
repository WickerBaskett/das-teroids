extends Node2D

const PROJECTILE = preload("uid://ddoufa6s84qes")
@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D
@onready var effect: Area2D = %Effect
@export var duration: float = 2.0
var active: bool = false

func _on_collectable_collected(_player: RigidBody2D) -> void:
	
	sprite_2d.visible = false
	collision_shape_2d.disabled = false
	active = true
	
	await get_tree().create_timer(duration).timeout
	
	call_deferred("queue_free")

func _physics_process(delta: float) -> void:
	if active:
		for area in effect.get_overlapping_areas():
			if area.has_method("hit") and not area.is_in_group("Player"):
				area.hit()

		collision_shape_2d.shape.set_deferred("radius", collision_shape_2d.shape.radius + 500 * delta)
