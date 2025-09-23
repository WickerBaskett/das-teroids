extends Node2D

# @export allows us to modify this value in the editor
@export var speed: float = 50.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Randomize asteroid speed in range [0.5 .. 5.5]
	speed *= randf() + 0.5;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Multiplying by delta makes asteroid speed consistent
	# across different frame rates
	var rotated_speed = Vector2(
			-sin(self.rotation) * speed * delta, 
			cos(self.rotation) * speed * delta
		)
	self.position += rotated_speed;
