extends State

# Time in Seconds before player can be hit again after shield breaks
const SHIELD_IFRAMES: float = 0.25

@onready var player: RigidBody2D = $"../.."
@onready var shield_recharge: Timer = %ShieldRecharge
@onready var shields: Node = %Shields
@onready var shield_break: GPUParticles2D = %ShieldBreak
@onready var damaged_audio: Node2D = %"Player Audio/Damaged Audio"


# Called when a state is first entered
func enter() -> void:
	if player.invincible:
		player.collided = false
		emit_signal("transition", self, "idle")
		return

	if player.shield > 0:
		player.shield -= 1
		shield_recharge.start()
		shields.get_children()[player.shield].play("break")
		damaged_audio.play()
		shield_break.emitting = true

	if shield_recharge.time_left < (shield_recharge.wait_time - SHIELD_IFRAMES):
		emit_signal("transition", self, "dead")
		return

	player.collided = false
	emit_signal("transition", self, "idle")
