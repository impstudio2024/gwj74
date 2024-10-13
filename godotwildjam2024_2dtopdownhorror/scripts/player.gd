extends CharacterBody2D
var speed = 150.0
@onready var sprite = $Sprite

func _ready():
	pass

func _process(delta):
	movement_controller()

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
