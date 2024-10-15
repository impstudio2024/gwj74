extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in [0,1,2,3,4,5]:
		for j in [0,1,2,3,4,5]:
			$GridContainer.add_child(load("res://scenes/minigames/block_packing/block_tile.tscn").instantiate())
			$GridContainer.get_child(len($GridContainer.get_children()) - 1).position = Vector2(i*32, j*32)
	$GridContainer.add_theme_constant_override("h_separation",0)
	$GridContainer.add_theme_constant_override("v_separation",0)
