extends Node2D

@export var speed: float = 5.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Randomize asteroid speed in range [0.5 .. 5.5]
	speed *= randf() + 0.5;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.y += speed;
