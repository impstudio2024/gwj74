extends Control

var counter = 0
var goal = 20
var inputable = true
var pressable = true
func _ready():
	get_parent().get_parent().get_node("Player").controllable = false


func _process(delta):
	$ProgressSprite.pause()
	$ProgressSprite.frame = counter/(goal/5)
	$Label.text = str(counter)
	if Input.is_action_just_pressed("interact"):
		get_parent().get_parent().get_node("Player").controllable = true
		queue_free()
	if pressable:
		if Input.is_action_just_pressed("move_down") and $PumpSprite.frame == 0:
			$PumpSprite.play("default")
			counter += 1
			pressable = false
		if Input.is_action_just_pressed("move_up") and $PumpSprite.frame == 3:
			$PumpSprite.play_backwards("default")
			counter += 1
			pressable = false
	if counter == goal:
		Global.pump_completed = true


func _on_pump_sprite_animation_finished():
	pressable = true
