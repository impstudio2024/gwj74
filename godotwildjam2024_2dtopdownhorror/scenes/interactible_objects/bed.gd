extends InteractableObject


func interact():
	if len(get_parent().get_node("PlayerCamera").get_children()) == 1:
		Global.day_counter += 1
		get_parent().get_node("PlayerCamera").black_screen()
