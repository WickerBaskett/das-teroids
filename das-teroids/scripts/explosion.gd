extends Node2D

@onready var lifetime: Timer = %Lifetime


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await lifetime.timeout
	call_deferred("queue_free")
