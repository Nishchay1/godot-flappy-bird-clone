extends KinematicBody2D

var gravity = 600

const max_speed = 800

var is_alive = true

var velocity = Vector2()

func _ready():
	pass
	
func _physics_process(delta):
	velocity.y+=gravity * delta
	if velocity.y > max_speed:
		velocity.y = max_speed
	if Input.is_action_just_pressed("flap") and is_alive:
		velocity.y=-280
	velocity = move_and_slide(velocity)

func game_over():
	hide()
	is_alive = false

func reset():
	show()
	is_alive = true
