extends Control

var numberOfKeys := 0

func _ready():
	set_anchors_preset(8)

func _number_Of_Keys():
	numberOfKeys = get_tree().get_nodes_in_group("Key").size()
	return numberOfKeys

func _update_keys():
	var updateKey = _number_Of_Keys()
	return updateKey - 1
