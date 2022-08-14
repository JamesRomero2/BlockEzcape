extends Node

#
#var attachLevel = load("res://Scenes/Levels/Level 2.tscn")
#
#export var doorNodePath = "GameArea/GameBoard/Level2/Puzzle/Interactables/Door"
#
#onready var levelNode = $GameArea/GameBoard
#onready var uiPanel = $UserInterface
#onready var doorNode = get_node(doorNodePath)
#
#var numberOfKeysInLevel := 0
#
#func _ready():
#	var sceneInstance = attachLevel.instance()
#	levelNode.add_child(sceneInstance)
#
#	var getLevelKeys = levelNode.get_child(0)
#	numberOfKeysInLevel = getLevelKeys._number_Of_Keys()
#	uiPanel._attach_keys_to_panel(numberOfKeysInLevel)
#	var keys = get_tree().get_nodes_in_group("Key")
#	for key in keys:
#		key.connect("KeyCollected", self, "_on_KeyCollected")
#
#func _on_KeyCollected():
#	numberOfKeysInLevel -= 1
#	uiPanel._attach_keys_to_panel(numberOfKeysInLevel)
#
#	if numberOfKeysInLevel == 0:
#		doorNode._playAnimation()
#		doorNode.doorState_set(true)
