extends NinePatchRect

onready var numLabel = $HBoxContainer/KeyLeftNumber

func _update_label(keyValue):
	numLabel.text = str(keyValue)
