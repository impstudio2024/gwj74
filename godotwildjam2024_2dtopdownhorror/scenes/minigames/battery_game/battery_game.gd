extends Control
var speed = 0.0
var current_mode = "a"
var lost = false
var balance = 0
var fading
var right_side
var counter = 0
var goal = 10
var rnd = RandomNumberGenerator.new()
var frame_counter = 0
func _ready():
	next_iteration()
	self.modulate[3] = 0
	get_parent().get_parent().get_node("Player").controllable = false
	fade()

func _process(delta):
	if !fading:
		if Input.is_action_just_pressed("move_left") and right_side and $Batteries.get_child(0).position.y <= 0:
			next_iteration()
			counter += 1
		if Input.is_action_just_pressed("move_right") and !right_side and $Batteries.get_child(0).position.y <= 0:
			next_iteration()
			counter += 1
	$Label.text = str(counter)
	frame_counter += 1
	if frame_counter == 10:
		frame_counter = 0
		for child in $UsedBatteries.get_children():
			if child.position.y > -1000:
				child.position.y -= 30
			else:
				child.queue_free()
		for child in $Batteries.get_children():
			if child.position.y > 0:
				child.position.y -= 30
	
func next_iteration():
	if counter == goal:
		fade()
		Global.batteries_completed = true
	for child in $Batteries.get_children():
		child.reparent($UsedBatteries)
	$Batteries.add_child(load("res://scenes/minigames/battery_game/battery.tscn").instantiate())
	$Batteries.add_child(load("res://scenes/minigames/battery_game/battery.tscn").instantiate())
	$Batteries.get_child(0).position += Vector2(-100,300)
	$Batteries.get_child(1).position += Vector2(100,300)
	right_side = round(rnd.randf())
	if right_side:
		$Batteries.get_child(1).frame = 1
	else:
		$Batteries.get_child(0).frame = 1
func fade():
	if modulate[3] < 1.0:
		fading = true
		while modulate[3] < 1.0:
			modulate[3] += 0.1
			await get_tree().create_timer(get_process_delta_time() * 10).timeout
		fading = false
	else:
		fading = true
		while modulate[3] > 0:
			modulate[3] -= 0.1
			await get_tree().create_timer(get_process_delta_time() * 10).timeout
		get_parent().get_parent().get_node("Player").controllable = true
		queue_free()
