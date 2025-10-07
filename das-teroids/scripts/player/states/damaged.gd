extends State

@onready var player: RigidBody2D = $"../.."
@onready var shield_recharge: Timer = %ShieldRecharge
@onready var shield: AnimatedSprite2D = %Shield
# Time in Seconds before player can be hit again after shield breaks
const shield_iframes: float = 0.25 

# Called when a state is first entered
func enter() -> void:
	if player.shield:
		player.shield = false
		shield_recharge.start()
		shield.play("break")

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
