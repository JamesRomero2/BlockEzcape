extends Node

onready var uiNode: CanvasLayer = $LevelUI
onready var gameAreaNode: Control = $GameArea

var levelNode: Control = null
var numberOfKeysRequired: int = 0

func _ready():
	gameAreaNode.add_child(GameManager._getWhereLevelScene().instance())
	
	levelNode = gameAreaNode.get_child(0)
	
	numberOfKeysRequired = levelNode._number_Of_Keys()
	uiNode._attach_keys_to_panel(numberOfKeysRequired)
	for key in get_tree().get_nodes_in_group("Key"):
		key.connect("KeyCollected", self, "_on_KeyCollected")

func _on_KeyCollected():
	numberOfKeysRequired -= 1
	uiNode._attach_keys_to_panel(numberOfKeysRequired)

	if numberOfKeysRequired <= 0:
		levelNode._activateDoorState()
