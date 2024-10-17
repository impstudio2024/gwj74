extends Control
var rnd = RandomNumberGenerator.new()
var side = 0.0
var counter = 0
var goal = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	next_iteration()
func _process(delta):
	remove_used_batteries()
	if counter == goal:
		visible = false
		queue_free()
	if Input.is_action_just_pressed("move_left"):
		if side == 0:
			counter += 1
			next_iteration()
	if Input.is_action_just_pressed("move_right"):
		if side == 1:
			counter += 1
			next_iteration()
func next_iteration():
	
	side = round(rnd.randf())
	get_parent().get_parent().get_node("Player").controllable = false
	for child in get_node("ActiveBatteries").get_children():
		child.reparent(get_node("UsedBatteries"))
	get_node("ActiveBatteries").add_child(load("res://scenes/minigames/battery_game/battery.tscn").instantiate())
	get_node("ActiveBatteries").add_child(load("res://scenes/minigames/battery_game/battery.tscn").instantiate())
	get_node("ActiveBatteries").get_child(0).position = Vector2(-100,0)
	get_node("ActiveBatteries").get_child(0).position = Vector2(100,0)
	get_node("ActiveBatteries").get_child(side).get_node("Sprite").texture = load("res://sprites/test_sprites/block_tile.png")

func remove_used_batteries():
	for child in $UsedBatteries.get_children():
		child.position += Vector2(0,4)
		if child.position.y > 1000:
			child.queue_free()
