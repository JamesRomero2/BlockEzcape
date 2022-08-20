extends Node

# Singleton
# This Script is loaded at the start of the game application

var levelScene setget _setWhereLevelScene, _getWhereLevelScene

func _setWhereLevelScene(value):
	levelScene = value

func _getWhereLevelScene():
	return levelScene
