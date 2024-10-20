extends CharacterBody2D
var speed = 150.0
var controllable = true
@onready var sprite = $Sprite
@onready var previous_window = DisplayServer.window_get_mode()
@onready var current_window = DisplayServer.window_get_mode()

func _ready():
	add_to_group("player")

func _process(delta):
	$InteractionSprite.visible = false
	show_interaction()
	if controllable:
		movement_controller()
	hotkey_controller()

func movement_controller():
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1

	if velocity:
		if is_equal_approx(PI / 2, velocity.angle()):
			sprite.play("moving_down")
		elif is_equal_approx(- PI / 2, velocity.angle()):
			sprite.play("moving_up")
		elif velocity.angle() > - PI / 2 and velocity.angle() < PI / 2:
			sprite.play("moving_right")
		else:
			sprite.play("moving_left")
		velocity = velocity.normalized() * speed
	else:
		sprite.frame = 1
		sprite.pause()
	move_and_slide()
	velocity = Vector2.ZERO
	
func hotkey_controller():
	if Input.is_action_just_pressed("ui_accept"):
		interact()

			
	if Input.is_action_just_pressed("zoom_in"):
		%PlayerCamera.zoom += Vector2(1,1)
	if Input.is_action_just_pressed("zoom_out"):
		%PlayerCamera.zoom -= Vector2(1,1)
		
	if Input.is_action_just_pressed("debug_walkonwater"):
		debug_walk_on_water()
	if Input.is_action_just_pressed("debug_togglefullscreen"):
		debug_toggle_fullscreen()
	if Input.is_action_just_pressed("debug_test_f10"):
		debug_test_f10()

func interact():
	for area in get_node("InteractionArea").get_overlapping_areas():
		if area is InteractableObject:
			area.interact()
			return true
	return false
	
func debug_walk_on_water():
	print("WALK ON WATER ENABLED")
	set_collision_mask_value(4,false)

func debug_toggle_fullscreen():
	current_window = DisplayServer.window_get_mode()
	if current_window != 4:
		previous_window = current_window
		DisplayServer.window_set_mode(4)
		#DisplayServer.dialog_show("test","no",PackedStringArray(), 1)
		
	else:
		if previous_window == 4:
			previous_window = 2
		DisplayServer.window_set_mode(previous_window)

func debug_test_f10():
	if DisplayServer.has_feature(DisplayServer.FEATURE_VIRTUAL_KEYBOARD):
		DisplayServer.virtual_keyboard_show("GOODBYE WORLD")
	else:
		print("shit")

func debug_resize_window_random():
	pass

func show_interaction():
	for area in get_node("InteractionArea").get_overlapping_areas():
		if area is InteractableObject:
			$InteractionSprite.visible = true
