extends Node

onready var levelSelection = $ButtonGroup

var buttonGroup = []

func _ready():
	for buttonLevel in levelSelection.get_children():
		buttonGroup.push_back(buttonLevel)
	print(buttonGroup)

