extends NinePatchRect

onready var numLabel: Label = $HBoxContainer/KeyLeftNumber

func _update_label(keyValue: int):
	numLabel.text = str(keyValue)
