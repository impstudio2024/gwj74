extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	position = get_parent().get_node("Player").position
