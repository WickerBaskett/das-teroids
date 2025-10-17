extends Node2D

@export var duration: float = 2.0

var active: bool = false

@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D
@onready var test_coll: CollisionShape2D = $Effect/CollisionShape2D
@onready var effect: Area2D = %Effect
@onready var effect_sprite: Sprite2D = %EffectSprite
@onready var collectable: Area2D = %Collectable

func _ready() -> void:
	animated_sprite_2d.play("idle")

func _on_collectable_collected(_player: RigidBody2D) -> void:
	animated_sprite_2d.visible = false
	collision_shape_2d.disabled = false
	effect_sprite.visible = true
	active = true
	scale = Vector2(1.0, 1.0)

	await get_tree().create_timer(duration).timeout

	call_deferred("queue_free")


func _physics_process(delta: float) -> void:
	if active:
		for area in effect.get_overlapping_areas():
			if area.has_method("hit") and not area.is_in_group("Player"):
				area.hit()
		effect_sprite.scale += Vector2(0.255, 0.255)
		#collision_shape_2d.shape.set_deferred("radius", collision_shape_2d.shape.radius + 500 * delta)
		test_coll.shape.set_deferred("radius", test_coll.shape.radius + 500 * delta)
