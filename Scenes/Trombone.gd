extends Area2D

var rng = RandomNumberGenerator.new()
export var active = false

func _ready():
	modulate.a = 0.5
	rng.randomize()
	rotation = rng.randf_range(0, 2 * PI)

func _process(delta):
	if active:
		var global_mouse_position = get_global_mouse_position()
		rotation = (global_mouse_position - global_position).angle() - PI / 2

func activate():
	modulate.a = 1.0
	active = true

func deactivate():
	modulate.a = 0.5
	active = false
