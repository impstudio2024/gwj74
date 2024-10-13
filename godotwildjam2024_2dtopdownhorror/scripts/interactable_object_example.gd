extends InteractableObject

func interact():
	get_parent().get_node("PlayerCamera/CanvasLayer/CenterContainer").add_child(load("res://scenes/computer_scene.tscn").instantiate())
