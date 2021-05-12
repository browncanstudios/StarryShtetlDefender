extends Node2D

export var speed = 0.5 * 2048

var notes_active = 2

func die():
	if get_tree() != null:
		get_tree().queue_delete(self)

func _ready():
	$Note1.velocity = speed * Vector2(0.5, -0.25).normalized()
	$Note2.velocity = speed * Vector2(0.25, -0.5).normalized()

func _on_Note1_tree_exited():
	notes_active -= 1
	if notes_active == 0:
		die()

func _on_Note2_tree_exited():
	notes_active -= 1
	if notes_active == 0:
		die()
