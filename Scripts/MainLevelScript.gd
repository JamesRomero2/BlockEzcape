extends Node

var levelNode
onready var uiNode = $LevelUI

var numberOfKeysRequired := 0
var level

func _ready():
	var instancedLevel = GameManager._getWhereLevelScene()
	$GameArea.add_child(instancedLevel.instance())
	
	levelNode = $GameArea.get_child(0)
	
	numberOfKeysRequired = levelNode._number_Of_Keys()
	uiNode._attach_keys_to_panel(numberOfKeysRequired)
	for key in get_tree().get_nodes_in_group("Key"):
		key.connect("KeyCollected", self, "_on_KeyCollected")

func _on_KeyCollected():
	numberOfKeysRequired -= 1
	uiNode._attach_keys_to_panel(numberOfKeysRequired)

	if numberOfKeysRequired <= 0:
		levelNode._activateDoorState()
