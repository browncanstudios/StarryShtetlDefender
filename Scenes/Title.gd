extends Node

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

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

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
