extends KinematicBody2D

onready var verticalCollision: CollisionShape2D = $VerticalCollision
onready var horizontalCollision: CollisionShape2D = $HorizontalCollision
onready var animations: AnimationPlayer = $AnimationPlayer

onready var arrows: Node2D = $Arrows

export(int) var playerSpeed: int = 16

var playerCanMove: bool = true
var characterLooking: bool = true
var playerVelocity: Vector2 = Vector2.ZERO
var arrowIndicator: Array = []

func _ready():
	var swipeControlNode = get_node("SwipeControl/Control/TouchScreenButton")
	swipeControlNode.connect("playerSwipeDirection", self, "_on_TouchScreenButton_swipeDirection")
	swipeControlNode.connect("playerGestureState", self, "_on_TouchScreenButton_characterState")
	for arrow in arrows.get_children():
		arrowIndicator.push_back(arrow)

	for i in range(arrowIndicator.size()):
		arrowIndicator[i].visible = false

func _physics_process(_delta: float):
	# If the player hold the screen, Look first to the direction
	if playerVelocity.x > 0:
		animations.play("look_right")
	elif playerVelocity.x < 0:
		animations.play("look_left")
	if playerVelocity.y > 0:
		animations.play("look_backward")
	elif playerVelocity.y < 0:
		animations.play("look_forward")
		
	# Arrow Indication functionality
	showArrow(playerVelocity, characterLooking)

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
	var playerCollision: KinematicCollision2D = move_and_collide(playerVelocity * playerSpeed)

	# If the player stops of collided with a wall, enable playerCanMove to accept another direction
	if playerCollision != null:
		playerCanMove = true

func _on_TouchScreenButton_swipeDirection(swipeDirection: Vector2):
	if playerCanMove:
		playerVelocity = swipeDirection

func _on_TouchScreenButton_characterState(characterState: bool):
	if playerCanMove:
		characterLooking = characterState

func showArrow(dir: Vector2, looking: bool):
	# Arrow Reseter
	for i in range(arrowIndicator.size()):
		arrowIndicator[i].visible = false
	
	# Check if the Character is Stationary to show arrow,
	# if the character is moving Do not Show Arrow
	if !looking: return
	
	# Get Direction to show Where should the arrow points to
	match dir:
		Vector2.UP:
			arrowIndicator[0].visible = true
		Vector2.DOWN:
			arrowIndicator[1].visible = true
		Vector2.LEFT:
			arrowIndicator[2].visible = true
		Vector2.RIGHT:
			arrowIndicator[3].visible = true
