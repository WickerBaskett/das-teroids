extends Area2D

const SPEED: float = 1000.0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

const explosion = preload("res://scenes/explosion.tscn")

func _ready() -> void:
	sprite_2d.play("default")


func _process(delta: float) -> void:
	var rotated_speed = Vector2(
		sin(self.rotation) * SPEED * delta, -cos(self.rotation) * SPEED * delta
	)
	self.position += rotated_speed


# On collision with asteroid
func _on_area_entered(area: Area2D) -> void:
	print("Proj hit area...")
	if area.has_method("hit"):
		area.hit()
		var kaboom = explosion.instantiate()
		kaboom.position = self.position
		get_node("/root/MainLevel").add_child(kaboom)
		call_deferred("queue_free")
