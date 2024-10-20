extends InteractableObject


func interact():
	Global.get_grandparent(self, 2).get_node("PlayerCamera").add_child(load("res://scenes/minigames/battery_game/battery_game.tscn").instantiate())
