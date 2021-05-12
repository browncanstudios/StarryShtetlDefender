extends Area2D

export var alive = true

func die():
	get_tree().queue_delete(self)

func _ready():
	$Exploding.hide()

func _on_Exploding_animation_finished():
	$Exploding.hide()
	die()

func was_hit():
	if alive == true:
		if $Alive.get_frame() + 1 < $Alive.get_sprite_frames().get_frame_count("default"):
			$Alive.set_frame($Alive.get_frame() + 1)
		else:
			alive = false
			$Alive.hide()
			$Exploding.show()
			$Exploding.play("default")
			$SmokeStack.die()

func _on_Planet_area_entered(area):
	if area.is_in_group("Asteroid"):
		area.was_hit()
		was_hit()

	if area.is_in_group("Note"):
		area.die()
