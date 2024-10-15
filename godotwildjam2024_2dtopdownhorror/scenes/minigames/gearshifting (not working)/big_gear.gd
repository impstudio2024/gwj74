extends Control
class_name BigGear

var shifted = false
var grid_position = Vector2(1,1)
var turned = false
var direction
var configured = false
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func turn(clockwise):
	var turned = true
	get_node("Sprite").play("turning_" + str(clockwise))
	for child in find_connected():
		if child.direction == clockwise:
			get_parent().break()
			return false
	for child in find_connected():
		if !child.turned:
			child.turn(!clockwise)

func find_connected():
	var array_to_return = []
	for gear in get_parent().get_children():
		if gear is SmallGear and is_equal_approx((gear.grid_position - grid_position).length(),sqrt(2)):
			array_to_return.append(gear)
	return array_to_return

func configure():
	for child in find_connected():
		if child == configured:
			configured = true
			break
	for child in find_connected():
		if child != configured:
			configure()
