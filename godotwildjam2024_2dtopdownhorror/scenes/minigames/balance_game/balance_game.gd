extends Control
var speed = 0.0
var current_mode = "a"
var lost = false
var balance = 0
var fading
var rnd = RandomNumberGenerator.new()
func _ready():
	self.modulate[3] = 0
	$ValveSprite.frame = 4
	get_parent().get_parent().get_node("Player").controllable = false
	fade()

func _process(delta):
	if !fading:
		$Timer.paused = false
		if Input.is_action_just_pressed("move_left"):
			current_mode = "a"
		if Input.is_action_just_pressed("move_right"):
			current_mode = "d"
		#fade()
		#get_parent().get_parent().get_node("Player").controllable = true
		#queue_free()



func fade():
	if modulate[3] < 1.0:
		fading = true
		while modulate[3] < 1.0:
			modulate[3] += 0.1
			await get_tree().create_timer(get_process_delta_time() * 10).timeout
		fading = false
		$Timer.start(5)
	else:
		fading = true
		while modulate[3] > 0:
			modulate[3] -= 0.1
			await get_tree().create_timer(get_process_delta_time() * 10).timeout
		get_parent().get_parent().get_node("Player").controllable = true
		queue_free()
