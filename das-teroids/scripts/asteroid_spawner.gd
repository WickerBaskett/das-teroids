extends Node2D

const ASTEROID = preload("uid://b3kmf2dcy04sj")
var view: Rect2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	view = get_viewport_rect();

func _on_timer_timeout() -> void:
	print("Spawning asteroid...")
	var instance = ASTEROID.instantiate();
	
	# Start in the top left corner of the view
	var pos = Vector2(view.position.x, view.position.y);
	match (randi() % 4):
		0: # Top Edge
			pos.x += randf() * view.size.x;
		1: # Bottom Edge
			pos.x += randf() * view.size.x;
			pos.y += view.size.y;
		2: # Left Edge
			pos.y += randf() * view.size.y;
		3: # Right Edge
			pos.y += randf() * view.size.y;
			pos.x += view.size.x;
	
	instance.position = pos;
	
	
	add_child(instance);
