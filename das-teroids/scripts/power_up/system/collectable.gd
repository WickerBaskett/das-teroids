extends Area2D

signal collected(player: RigidBody2D)

var collected_flag: bool = false
@onready var collected_audio: Node2D = %"Collected Audio"


func collect() -> void:
	collected_flag = true
	var bodies = get_tree().get_nodes_in_group("Players")

	if len(bodies) > 0:
		emit_signal("collected", bodies[0])
		SignalBus.emit_signal("stop_moving", self)
		collected_audio.play()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Players") and not collected_flag:
		collect()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Projectile") and not collected_flag:
		collect()
		if area.has_method("hit"):
			area.hit()
