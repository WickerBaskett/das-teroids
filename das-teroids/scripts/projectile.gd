extends Area2D

const SPEED: float = 1000.0

func _process(delta: float) -> void:
	var rotated_speed = Vector2(
		sin(self.rotation) * SPEED * delta, -cos(self.rotation) * SPEED * delta
	)
	self.position += rotated_speed

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("hit"):
		body.hit()
