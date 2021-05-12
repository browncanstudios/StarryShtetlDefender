extends Area2D

var rng = RandomNumberGenerator.new()

var velocity = Vector2(0, 0)
var angular_velocity = 0

func die():
	get_tree().queue_delete(self)

func _ready():
	rng.randomize()
	$Exploding.hide()

	# each "frame" is really just a different sprite/style, so let's pick one at random
	var frame = rng.randi_range(0, $Alive.get_sprite_frames().get_frame_count("default"))
	$Alive.set_frame(frame)

	angular_velocity = 0.5 * rng.randf_range(-PI, PI)

func init(p, v):
	position = p
	velocity = v

func _process(delta):
	position += velocity * delta
	rotation += angular_velocity * delta

	if position.x < - 2.0 * 4096:
		die()
	if position.x > 4.0 * 4096:
		die()
	if position.y < - 2.0 * 4096:
		die()
	if position.y > 4.0 * 4096:
		die()

func _on_Exploding_animation_finished():
	$Exploding.hide()
	die()

func was_hit():
	velocity = Vector2(0, 0)
	$Alive.hide()
	$Exploding.show()
	$Exploding.play("default")

func _on_Asteroid_area_entered(area):
	if area.is_in_group("Asteroid"):
		area.was_hit()
		was_hit()

	if area.is_in_group("Note"):
		area.die()
		was_hit()
