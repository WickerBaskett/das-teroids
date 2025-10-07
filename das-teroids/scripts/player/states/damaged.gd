extends State

@onready var player: RigidBody2D = $"../.."
@onready var shield_recharge: Timer = %ShieldRecharge
# Time in Seconds before player can be hit again after shield breaks
const shield_iframes: float = 0.25 

# Called when a state is first entered
func enter() -> void:
	print("Enter damaged")
	print(shield_recharge.time_left)
	print(shield_recharge.time_left - shield_iframes)
	
	if player.shield:
		player.shield = false
		shield_recharge.start()

	if shield_recharge.time_left < (shield_recharge.wait_time - shield_iframes):
		emit_signal("transition", self, "dead")
		return
	
	player.collided = false
	emit_signal("transition", self, "idle")


# Called when a state is exited
func exit() -> void:
	pass


# Called from physics_process(delta: float)
func physics_update(_delta: float) -> void:
	pass


# Called from process(delta: float)
func process_update(_delta: float) -> void:
	pass
