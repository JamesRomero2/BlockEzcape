extends CanvasLayer

onready var pausePanel: Control = $PauseLayer
onready var continueButton: Button = $PauseLayer/VBoxContainer/ContinueButton
onready var mainMenuButton: Button = $PauseLayer/VBoxContainer/MainMenuButton

var mainMenuScene: PackedScene = load("res://Scenes/MapScene.tscn")

func _ready():
	pausePanel.hide()

func _pauseGame():
	get_tree().paused = !get_tree().paused
	pausePanel.show()

func _input(event: InputEvent):
	if event is InputEventMouse:
		if continueButton.is_pressed():
			get_tree().paused = false
			pausePanel.hide()
		if mainMenuButton.is_pressed():
			get_tree().paused = false
			var ERR: int = get_tree().change_scene_to(mainMenuScene)
			
			if ERR != OK:
				print("Something went Wrong")
