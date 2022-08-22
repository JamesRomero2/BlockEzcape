extends Node

# Singleton
# This Script is loaded at the start of the game application

var levelScene : PackedScene setget _setWhereLevelScene, _getWhereLevelScene

func _setWhereLevelScene(value: PackedScene):
	levelScene = value

func _getWhereLevelScene():
	return levelScene
