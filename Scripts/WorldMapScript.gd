extends Node

onready var enterButton: Button = $MapUI/UI/EnterButton

var nextLevel: PackedScene setget _setLevelScene, _getLevelScene
var proceed: bool setget _setProceedLevel, _getProceedLevel
var mainLevelScene = preload("res://Scenes/LevelScene.tscn")

func _ready():
	for level in get_tree().get_nodes_in_group("Levels"):
		level.connect("levelScene", self, "_on_PlayerEnterLevel")

func _on_PlayerEnterLevel(stage, proceedLevel):
	_setLevelScene(stage)
	_setProceedLevel(proceedLevel)

func _setLevelScene(value: PackedScene):
	nextLevel = value

func _getLevelScene():
	return nextLevel

func _setProceedLevel(value: bool):
	proceed = value

func _getProceedLevel():
	return proceed

func _input(event: InputEvent):
	if _getProceedLevel():
		if event is InputEventMouse and enterButton.is_pressed():
			get_tree().change_scene_to(mainLevelScene)
			GameManager._setWhereLevelScene(_getLevelScene())

