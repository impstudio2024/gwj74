extends InteractableObject


func interact():
	Global.get_grandparent(self, 2).get_node("PlayerCamera").black_screen()
