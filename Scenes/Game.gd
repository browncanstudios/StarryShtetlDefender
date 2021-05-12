extends Node

var rng = RandomNumberGenerator.new()
var score = 0

func _ready():
	rng.randomize()
	
	$GameOver.hide()
	$RetryButton.hide()
	
func _process(delta):
	if $AsteroidSpawnTimer.is_stopped():
		$AsteroidSpawnTimer.start(rng.randf_range(1, 2))

func deactivate_instruments():
	$Clarinet.deactivate()
	$Trombone.deactivate()
	$Saxophone.deactivate()
	$Violin.deactivate()
	$Bass.deactivate()
	$Drum.deactivate()

func _on_Clarinet_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			deactivate_instruments()
			$Clarinet.activate()

func _on_Trombone_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			deactivate_instruments()
			$Trombone.activate()

func _on_Saxophone_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			deactivate_instruments()
			$Saxophone.activate()

func _on_Violin_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			deactivate_instruments()
			$Violin.activate()

func _on_Bass_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			deactivate_instruments()
			$Bass.activate()

func _on_Drum_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			deactivate_instruments()
			$Drum.activate()

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if $Clarinet.active:
				var attack = load("res://Scenes/ClarinetAttack.tscn").instance()
				attack.position = $Clarinet.position
				attack.rotation = $Clarinet.rotation
				add_child(attack)
			if $Violin.active:
				var attack = load("res://Scenes/ViolinAttack.tscn").instance()
				attack.position = $Violin.position
				attack.rotation = $Violin.rotation
				add_child(attack)
			if $Saxophone.active:
				var attack = load("res://Scenes/SaxophoneAttack.tscn").instance()
				attack.position = $Saxophone.position
				attack.rotation = $Saxophone.rotation
				add_child(attack)
			if $Trombone.active:
				var attack = load("res://Scenes/TromboneAttack.tscn").instance()
				attack.position = $Trombone.position
				attack.rotation = $Trombone.rotation
				add_child(attack)
			if $Drum.active:
				var attack = load("res://Scenes/DrumAttack.tscn").instance()
				attack.position = $Drum.position
				attack.rotation = $Drum.rotation
				add_child(attack)
			if $Bass.active:
				var attack = load("res://Scenes/BassAttack.tscn").instance()
				attack.position = $Bass.position
				attack.rotation = $Bass.rotation
				add_child(attack)

func _on_AsteroidSpawnTimer_timeout():
	var target = Vector2(2048 / 2, 2048 / 2)

	if is_instance_valid($Planet):
		target = $Planet.position

	var asteroid = load("res://Scenes/Asteroid.tscn").instance()

	var angle = rng.randf_range(0, 2 * PI)
	var p = target + get_viewport().size.x * 2.0 * Vector2(cos(angle), sin(angle))
	var v = rng.randf_range(2048 * 0.05, 2048 * 0.1) * (target - p).normalized()

	asteroid.init(p, v)
	add_child(asteroid)

func _on_RetryButton_pressed():
#	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_Planet_tree_exited():
	$GameOver.show()
	$RetryButton.show()
	$ScoreTimer.stop()
#	get_tree().paused = true

func _on_ScoreTimer_timeout():
	score += 1
	$Score.set_text("score: " + str(score))
