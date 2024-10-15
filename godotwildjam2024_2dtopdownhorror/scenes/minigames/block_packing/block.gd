extends Control
var tile_position = Vector2.ZERO
var pipe_type 
func _ready():
	get_node("Sprite").texture = load("res://sprites/test_sprites/"+pipe_type+"_pipe.png")

func _process(delta):
	pass
