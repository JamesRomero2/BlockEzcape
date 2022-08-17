extends CanvasLayer

onready var pausePanel = $PauseLayer
onready var continueButton = $PauseLayer/VBoxContainer/ContinueButton

func _ready():
	pausePanel.hide()
	pass

func _pauseGame():
	get_tree().paused = !get_tree().paused
	pausePanel.show()

func _input(event):
	if event is InputEventMouse and continueButton.is_pressed():
		get_tree().paused = false
		pausePanel.hide()
