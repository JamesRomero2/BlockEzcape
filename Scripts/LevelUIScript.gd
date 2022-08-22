extends CanvasLayer

onready var requiredKeyPanel: Control = $RequiredKeyPanel
onready var pauseButton: Button = $NavigationButtons/PauseButton
onready var pausePanel: CanvasLayer = $PausePanel

func _attach_keys_to_panel(keyNumber: int):
	requiredKeyPanel._update_label(keyNumber)

func _input(event: InputEvent):
	if event is InputEventMouse and pauseButton.is_pressed():
		pausePanel._pauseGame()
