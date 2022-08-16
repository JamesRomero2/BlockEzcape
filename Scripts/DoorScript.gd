extends Area2D

onready var animationNode = $AnimationPlayer

var doorOpen = false setget doorState_set

func _playAnimation():
	animationNode.play("Door_Open")

func doorState_set(doorState):
	doorOpen = doorState
	_playAnimation()

func _on_Door_body_entered(body:Node):
	if body.name == "Player" and doorOpen:
		print("Door Open")
