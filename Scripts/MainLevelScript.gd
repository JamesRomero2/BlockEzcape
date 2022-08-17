extends Node

onready var levelNode = $GameArea.get_child(0)
onready var uiNode = $LevelUI

var numberOfKeysRequired := 0

func _ready():
	numberOfKeysRequired = levelNode._number_Of_Keys()
	uiNode._attach_keys_to_panel(numberOfKeysRequired)
	for key in get_tree().get_nodes_in_group("Key"):
		key.connect("KeyCollected", self, "_on_KeyCollected")

func _on_KeyCollected():
	numberOfKeysRequired -= 1
	uiNode._attach_keys_to_panel(numberOfKeysRequired)

	if numberOfKeysRequired <= 0:
		levelNode._activateDoorState()
