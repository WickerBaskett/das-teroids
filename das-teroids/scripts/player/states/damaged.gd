extends State

@onready var player: RigidBody2D = $"../.."
@onready var shield_recharge: Timer = %ShieldRecharge
@onready var gpu_particles_2d: GPUParticles2D = $"../../Shield/GPUParticles2D"
@onready var shields: Node = %Shields
@onready var shield_break: GPUParticles2D = %ShieldBreak

# Time in Seconds before player can be hit again after shield breaks
const shield_iframes: float = 0.25 

# Called when a state is first entered
func enter() -> void:
	if player.shield > 0:
		player.shield -= 1
		shield_recharge.start()
		shields.get_children()[player.shield].play("break")
		shield_break.emitting = true

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
