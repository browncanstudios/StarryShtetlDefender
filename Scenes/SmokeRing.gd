extends Node2D

var velocity = Vector2(0, 0)
var initial_position = Vector2(0, 0)

func die():
	get_tree().queue_delete(self)

func _ready():
	pass

func init(p, v):
	initial_position = p
	position = p
	velocity = v

func _process(delta):
	position += velocity * delta

	var max_distance = 2048.0 / 16.0
	var distance = position.distance_to(initial_position)

	scale = (float(distance) / float(max_distance)) * Vector2(1.0, 1.0)
	modulate.a = float(min(distance, max_distance - distance)) / float(max_distance / 2)

	if distance > max_distance:
		die()
