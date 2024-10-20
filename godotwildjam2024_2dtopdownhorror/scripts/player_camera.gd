extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	position = get_parent().get_node("Player").position

func black_screen():
	if len(get_children()) == 1:
		get_parent().get_node("Player").controllable = false
		while $ColorRect.modulate[3] < 1.0:
			$ColorRect.modulate[3] += 0.2
			await get_tree().create_timer(get_process_delta_time()*10).timeout
		add_child(load("res://scenes/computer_scene.tscn").instantiate())
		while get_child(len(get_children())-1).modulate[3] < 1:
			get_child(len(get_children())-1).modulate[3] += 0.2
			await get_tree().create_timer(get_process_delta_time()*10).timeout
	else:
		get_parent().get_node("Player").controllable = true
		while $ColorRect.modulate[3] > 0:
			$ColorRect.modulate[3] -= 0.2
			await get_tree().create_timer(get_process_delta_time()*10).timeout
