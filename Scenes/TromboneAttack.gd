extends Node2D

export var speed1 = 0.4 * 2048
export var speed2 = 0.6 * 2048

var notes_active = 2

func die():
	if get_tree() != null:
		get_tree().queue_delete(self)

func _ready():
	$Note1.velocity = speed1 * Vector2(0, 1.0).normalized()
	$Note2.velocity = speed2 * Vector2(0, 1.0).normalized()

func _on_Note1_tree_exited():
	notes_active -= 1
	if notes_active == 0:
		die()

func _on_Note2_tree_exited():
	notes_active -= 1
	if notes_active == 0:
		die()
