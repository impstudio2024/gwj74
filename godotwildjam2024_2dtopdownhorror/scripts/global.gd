extends Node


func get_grandparent(node : Node,parent_generation : int):
	var i = 0
	var parent = node
	while i < parent_generation:
		i += 1
		parent = parent.get_parent()
	return parent
