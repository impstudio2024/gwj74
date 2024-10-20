extends InteractableObject


func interact():
	Global.get_grandparent(self, 2).get_node("PlayerCamera").add_child(load("res://scenes/minigames/balance_game/balance_game.tscn").instantiate())
