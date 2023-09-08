extends Area2D

var velocity = Vector2()

var speed = -200

signal collide

func _ready():
	pass

func _physics_process(delta):
	velocity.x = speed
	position += velocity * delta

func stop():
	speed = 0
