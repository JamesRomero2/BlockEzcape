extends Control

onready var doorNode : Node = $Puzzle/Door

var numberOfKeys: int = 0

func _number_Of_Keys():
	numberOfKeys = get_tree().get_nodes_in_group("Key").size()
	return numberOfKeys

func _activateDoorState():
	doorNode.doorState_set(true)
