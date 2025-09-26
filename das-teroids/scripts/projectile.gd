extends Area2D

const SPEED: float = 1000.0


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
	call_deferred("queue_free")
