extends CanvasLayer

onready var pausePanel = $PauseLayer
onready var continueButton = $PauseLayer/VBoxContainer/ContinueButton
onready var mainMenuButton = $PauseLayer/VBoxContainer/MainMenuButton

var mainMenuScene = load("res://Scenes/MapScene.tscn")

func _ready():
	pausePanel.hide()
	pass

func _pauseGame():
	get_tree().paused = !get_tree().paused
	pausePanel.show()

func _input(event):
	if event is InputEventMouse:
		if continueButton.is_pressed():
			get_tree().paused = false
			pausePanel.hide()
		if mainMenuButton.is_pressed():
			get_tree().paused = false
			var ERR = get_tree().change_scene_to(mainMenuScene)
			
			if ERR != OK:
				print("Something went Wrong")
