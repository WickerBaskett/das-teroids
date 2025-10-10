extends State

# Time in Seconds before player can be hit again after shield breaks
const SHIELD_IFRAMES: float = 0.25

@onready var player: RigidBody2D = $"../.."
@onready var shield_recharge: Timer = %ShieldRecharge
@onready var shield: AnimatedSprite2D = %Shield
@onready var gpu_particles_2d: GPUParticles2D = $"../../Shield/GPUParticles2D"



# Called when a state is first entered
func enter() -> void:
	if player.shield:
		player.shield = false
		shield_recharge.start()
		shield.play("break")
		gpu_particles_2d.emitting = true

	if shield_recharge.time_left < (shield_recharge.wait_time - SHIELD_IFRAMES):
		emit_signal("transition", self, "dead")
		return

	player.collided = false
	emit_signal("transition", self, "idle")
