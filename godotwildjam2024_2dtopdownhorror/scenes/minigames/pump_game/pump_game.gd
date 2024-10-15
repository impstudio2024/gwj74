extends Control

var counter = 0
var goal = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_parent().get_node("Player").controllable = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = str(counter)
	if Input.is_action_just_pressed("move_down") and $TransparencyCheck.visible:
		$BlockTile.visible = true
		$TransparencyCheck.visible = false
		counter += 1
	if Input.is_action_just_pressed("move_up") and $BlockTile.visible:
		$BlockTile.visible = false
		$TransparencyCheck.visible = true
		counter += 1
	if counter == goal:
		get_parent().get_parent().get_node("Player").controllable = true
		queue_free()
