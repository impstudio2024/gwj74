extends Control
var speed = 0.5
var current_mode = "a"
var lost = false
var balance = 0

func _ready():
	get_parent().get_parent().get_node("Player").controllable = false
	$Timer.start(5)

func _process(delta):
	if Input.is_action_just_pressed("move_left"):
		current_mode = "a"
	if Input.is_action_just_pressed("move_right"):
		current_mode = "d"
	if current_mode == "a":
		speed -= 0.1
	if current_mode == "d":
		speed += 0.1
	balance += speed 
	if abs(balance) > 60:
		printerr()
		get_parent().get_parent().get_node("Player").controllable = true
		queue_free()
	$TransparencyCheck.rotation = deg_to_rad(balance)


func _on_timer_timeout():
	print("win")
	get_parent().get_parent().get_node("Player").controllable = true
	queue_free()
