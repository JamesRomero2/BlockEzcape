extends KinematicBody2D

onready var ray = $RayCast2D
var gridSize := 16.00
var canMove = true
var inputDirection = Vector2.ZERO

func _physics_process(_delta):
	if canMove:
		if Input.is_action_just_pressed("ui_up"):
			inputDirection = Vector2.UP
			canMove = false
		elif Input.is_action_just_pressed("ui_down"):
			inputDirection = Vector2.DOWN
			canMove = false
		if Input.is_action_just_pressed("ui_left"):
			inputDirection = Vector2.LEFT
			canMove = false
		elif Input.is_action_just_pressed("ui_right"):
			inputDirection = Vector2.RIGHT
			canMove = false
	else:
		move(inputDirection)

func move(direction):
	var vectorPosition = direction * gridSize
	ray.cast_to = direction * (gridSize / 2)
	ray.force_raycast_update()
	var rayColliding = ray.is_colliding()

	if rayColliding:
		canMove = true
		return
	position += vectorPosition
