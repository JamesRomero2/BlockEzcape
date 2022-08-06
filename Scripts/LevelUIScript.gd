extends Control

onready var requiredKeyPanel = $RequiredKeyPanel

func _attach_keys_to_panel(keyNumber):
	requiredKeyPanel._update_label(keyNumber)
