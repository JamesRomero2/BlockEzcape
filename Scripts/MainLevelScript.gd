extends Node

onready var levelNode = $GameArea/Level1
onready var uiPanel = $UserInterface

var numberOfKeysInLevel := 0


func _ready():
	numberOfKeysInLevel = levelNode._number_Of_Keys()
	uiPanel._attach_keys_to_panel(numberOfKeysInLevel)
	var keys = get_tree().get_nodes_in_group("Key")
	for key in keys:
		key.connect("KeyCollected", self, "_on_KeyCollected")

func _on_KeyCollected():
	numberOfKeysInLevel -= 1
	uiPanel._attach_keys_to_panel(numberOfKeysInLevel)
