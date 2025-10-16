extends Node2D

const A_E = preload("uid://w5th50kqan0q")
const A_HAMPTER = preload("uid://du6q5vtlbxb68")
const A_J = preload("uid://c3pec6ff8dt44")
const A_JEN = preload("uid://bihwelms66yro")
const A_ALEX = preload("uid://bibnhhn0d7swa")
const A_G = preload("uid://2hdgbpa2bqxw")
const A_A = preload("uid://c2cc0lisfkpck")

@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var asteroid: Node2D = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match randi() % 7:
		0:
			sprite_2d.texture = A_E
		1:
			sprite_2d.texture = A_HAMPTER
		2:
			sprite_2d.texture = A_J
		3:
			sprite_2d.texture = A_JEN
		4:
			sprite_2d.texture = A_ALEX
		5:
			sprite_2d.texture = A_G
		6:
			sprite_2d.texture = A_A


func die() -> void:
	asteroid.call_deferred("queue_free")


func hit():
	die()


# On player collision
func _on_body_entered(body: Node2D) -> void:
	print("Body Hit Asteroid...")
	if body.has_method("hit"):
		body.hit()
		die()
