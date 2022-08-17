extends CanvasLayer

onready var requiredKeyPanel = $RequiredKeyPanel
onready var pauseButton = $NavigationButtons/PauseButton
onready var pausePanel = $PausePanel

func _attach_keys_to_panel(keyNumber):
	requiredKeyPanel._update_label(keyNumber)

func _input(event):
	if event is InputEventMouse and pauseButton.is_pressed():
		pausePanel._pauseGame()
