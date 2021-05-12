extends Area2D

var velocity = Vector2(0, 0)

func die():
	get_tree().queue_delete(self)

func init(p, v):
	position = p
	velocity = v

func _process(delta):
	position += velocity * delta
	
	if position.x < - 2.0 * 4096:
		die()
	if position.x > 4.0 * 4096:
		die()
	if position.y < - 2.0 * 4096:
		die()
	if position.y > 4.0 * 4096:
		die()
