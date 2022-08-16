extends KinematicBody2D

onready var verticalCollision = $VerticalCollision
onready var horizontalCollision = $HorizontalCollision
onready var animations = $AnimationPlayer

export(int) var playerSpeed := 16

var playerCanMove := true
var characterLooking := true
var playerVelocity := Vector2.ZERO

func _ready():
	var swipeControlNode = get_node("SwipeControl/Control/TouchScreenButton")
	swipeControlNode.connect("playerSwipeDirection", self, "_on_TouchScreenButton_swipeDirection")
	swipeControlNode.connect("playerGestureState", self, "_on_TouchScreenButton_characterState")

func _physics_process(_delta):
	# If the player hold the screen, Look first to the direction
	if playerVelocity.x > 0:
		animations.play("look_right")
	elif playerVelocity.x < 0:
		animations.play("look_left")
	if playerVelocity.y > 0:
		animations.play("look_backward")
	elif playerVelocity.y < 0:
		animations.play("look_forward")

	# If the player let go of the screen proceed the character to the given direction
	if characterLooking: return

	# Check if the character is in motion, if the character is in motion do not accept direction.
	if playerVelocity != Vector2.ZERO:
		playerCanMove = false

	# Enable and Disbable Horizontal and Vertical Collisions
	if playerVelocity.x != 0:
		horizontalCollision.disabled = false
		verticalCollision.disabled = true
	elif playerVelocity.y != 0:
		horizontalCollision.disabled = true
		verticalCollision.disabled = false

	# Move the player
	var playerCollision = move_and_collide(playerVelocity * playerSpeed)

	# If the player stops of collided with a wall, enable playerCanMove to accept another direction
	if playerCollision != null:
#		Input.vibrate_handheld(500)
		playerCanMove = true

func _on_TouchScreenButton_swipeDirection(swipeDirection:Vector2):
	if playerCanMove:
		playerVelocity = swipeDirection

func _on_TouchScreenButton_characterState(characterState: bool):
	if playerCanMove:
		characterLooking = characterState
