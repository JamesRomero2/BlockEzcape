extends KinematicBody2D

onready var verticalCollision = $VerticalCollision
onready var horizontalCollision = $HorizontalCollision
onready var animations = $AnimationPlayer

export(int) var playerSpeed := 16

var playerCanMove := true
var characterLooking := true
var playerVelocity := Vector2.ZERO

func _physics_process(_delta):
	# Check if the character is in motion, if the character is in motion do not accept direction.
	if playerVelocity != Vector2.ZERO:
		playerCanMove = false

	# If the player hold the screen, Look first to the direction

	# If the player let go of the screen proceed the character to the given direction

	# Move the player
	var playerCollision = move_and_collide(playerVelocity * playerSpeed)

	# If the player stops of collided with a wall, enable playerCanMove to accept another direction
	if playerCollision != null:
		playerCanMove = true
