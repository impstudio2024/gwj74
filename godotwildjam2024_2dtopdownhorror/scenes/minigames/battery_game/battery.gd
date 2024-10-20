extends AnimatedSprite2D

var right_side = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if right_side:
		position += Vector2(30,0)
	else:
		position += Vector2(-30,0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
