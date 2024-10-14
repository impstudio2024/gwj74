extends InteractableObject

func interact():
	if get_parent().get_node("Player").controllable:
		get_parent().get_node("PlayerCamera").add_child(load("res://scenes/computer_scene.tscn").instantiate())
	else:
		get_parent().get_node("PlayerCamera").get_node("ComputerScene").close()
		
