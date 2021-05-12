extends Node2D

func die():
	get_tree().queue_delete(self)

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	var smoke_ring = load("res://Scenes/SmokeRing.tscn").instance()
	smoke_ring.init(Vector2(0, 0), Vector2(0, - 2048 / 48))
	add_child(smoke_ring)
