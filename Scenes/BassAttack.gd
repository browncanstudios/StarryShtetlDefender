extends Node2D

export var speed = 0.2 * 2048

var notes_active = 6

func die():
	get_tree().queue_delete(self)

func _ready():
	$Note1.velocity = speed * Vector2(-0.5, -0.5).normalized()
	$Note2.velocity = speed * Vector2(-1.0, 0).normalized()
	$Note3.velocity = speed * Vector2(-0.5, 0.5).normalized()
	$Note4.velocity = speed * Vector2(0.5, 0.5).normalized()
	$Note5.velocity = speed * Vector2(1.0, 0).normalized()
	$Note6.velocity = speed * Vector2(0.5, -0.5).normalized()
