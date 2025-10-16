extends MovingObject

const DAS_BLAST = preload("uid://drvdab6gc1cfq")
const CHAPPEL_CHOMP = preload("uid://botemo7ekakif")
const JENA_JUGGERNAUT = preload("uid://c6nx8u3qyeead")
const LAWLOR_LAG = preload("uid://7rr5innia2qy")
const SHWARTZ_SHOT = preload("uid://bmpiritw37k1o")

var screen_effect: bool = false


func _ready() -> void:
	SignalBus.connect("stop_moving", _stop_moving)
	match 0:  #randi() % 5:
		0:
			add_child(DAS_BLAST.instantiate())
		1:
			add_child(CHAPPEL_CHOMP.instantiate())
			screen_effect = true
		2:
			add_child(JENA_JUGGERNAUT.instantiate())
		3:
			add_child(LAWLOR_LAG.instantiate())
			screen_effect = true
		4:
			add_child(SHWARTZ_SHOT.instantiate())


func _stop_moving(node: Node2D) -> void:
	if self.get_children().size() != 1:
		return

	var powerup = self.get_child(0)
	if !powerup.is_class("Node2D"):
		return

	for child in powerup.get_children():
		if child.is_in_group("Collectable") and child == node:
			rotation = 0.0
			speed = 0.0

			# Set the position to top left corner of viewport so
			# post processing effects cover entire screen
			if screen_effect:
				print("Screen effect powerup collected")
				position = get_viewport_rect().position

			return
