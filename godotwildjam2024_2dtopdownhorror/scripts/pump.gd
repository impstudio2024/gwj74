extends InteractableObject


func interact():
	Global.get_grandparent(self, 2).get_node("PlayerCamera").add_child(load("res://scenes/minigames/pump_game/pump_game.tscn").instantiate())
