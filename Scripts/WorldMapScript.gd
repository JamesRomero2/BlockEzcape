extends Node

onready var enterButton = $MapUI/UI/EnterButton

var nextLevel setget _setLevelScene, _getLevelScene
var mainLevelScene = preload("res://Scenes/LevelScene.tscn")

func _ready():
	for level in get_tree().get_nodes_in_group("Levels"):
		level.connect("levelScene", self, "_on_PlayerEnterLevel")

func _on_PlayerEnterLevel(stage):
	_setLevelScene(stage)

func _setLevelScene(value):
	nextLevel = value

func _getLevelScene():
	return nextLevel

func _input(event):
	if event is InputEventMouse and enterButton.is_pressed():
		get_tree().change_scene_to(mainLevelScene)
		GameManager._setWhereLevelScene(_getLevelScene())

