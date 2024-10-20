extends CharacterBody2D
var speed = 150.0
var controllable = true
@onready var sprite = $Sprite

func _ready():
	pass

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

func interact():
	for area in get_node("InteractionArea").get_overlapping_areas():
		if area is InteractableObject:
			area.interact()
			return true
	return false

func show_interaction():
	for area in get_node("InteractionArea").get_overlapping_areas():
		if area is InteractableObject:
			$InteractionSprite.visible = true
