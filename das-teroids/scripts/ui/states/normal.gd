extends State

@onready var magizine: Node = $"../../Magizine"
@onready var ui: Control = $"../.."

const PROJECTILE_X_SIZE: int = 20
const INITIAL_MAG_POS: Vector2 = Vector2(28,100)

var bullets: Array
var last_mag: int = 3

func enter() -> void:
	last_mag = ui.player.mag
	# Set up player magizine ui
	var pos = INITIAL_MAG_POS
	for child in magizine.get_children():
		bullets.append(child)
		child.position = pos
		pos.x += PROJECTILE_X_SIZE * 1.25
		child.play()

# Called from process(delta: float)
func process_update(_delta: float) -> void:
	if ui.game_over_flag:
		emit_signal("transition", self, "gameover")
	
	if last_mag > ui.player.mag:
		bullets[last_mag - 1].visible = false
		last_mag = ui.player.mag

	elif last_mag < ui.player.mag:
		bullets[last_mag].visible = true
		last_mag = ui.player.mag
