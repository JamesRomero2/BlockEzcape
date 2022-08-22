extends Area2D

onready var animationNode : AnimationPlayer = $AnimationPlayer

var doorOpen: bool = false setget doorState_set
var mainMenuScene: PackedScene = load("res://Scenes/MapScene.tscn")

func _playAnimation():
	animationNode.play("Door_Open")

func doorState_set(doorState):
	doorOpen = doorState
	_playAnimation()

func _on_Door_body_entered(body:Node):
	if body.name == "Player" and doorOpen:
		var ERR : int = get_tree().change_scene_to(mainMenuScene)
		
		if ERR != OK:
			print("Something went Wrong")
