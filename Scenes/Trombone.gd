extends Area2D

var rng = RandomNumberGenerator.new()
export var active = false

func _ready():
	modulate.a = 0.5
	rng.randomize()
	rotation = rng.randf_range(0, 2 * PI)

func _process(delta):
	if active:
		var mouse_position = get_viewport().get_mouse_position()
		rotation = (mouse_position - position).angle() - PI / 2

func activate():
	modulate.a = 1.0
	active = true

func deactivate():
	modulate.a = 0.5
	active = false
