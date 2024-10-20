extends Control
var counter = 0
var goal = 20
var inputable = true
var pressable = true
var fading
func _ready():
	get_parent().get_parent().get_node("Player").controllable = false
	fade()

func _process(delta):
	$ProgressSprite.pause()
	$ProgressSprite.frame = counter/(goal/5)
	$Label.text = str(counter)
	if Input.is_action_just_pressed("interact") and !fading:
		fade()
	if pressable and !fading:
		if Input.is_action_just_pressed("move_down") and $PumpSprite.frame == 0:
			$PumpSprite.play("default")
			counter += 1
	if counter >= goal:
		fade()
			
func _on_pump_sprite_animation_finished():
	pressable = true

func fade():
	if modulate[3] < 1.0:
		fading = true
		while modulate[3] < 1.0:
			modulate[3] += 0.1
			await get_tree().create_timer(get_process_delta_time() * 10).timeout
		fading = false
	else:
		fading = true
		while modulate[3] > 0:
			modulate[3] -= 0.1
			await get_tree().create_timer(get_process_delta_time() * 10).timeout
		get_parent().get_parent().get_node("Player").controllable = true
		queue_free()
