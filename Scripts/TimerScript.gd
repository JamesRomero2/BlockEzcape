extends NinePatchRect

export(int) var minutes: int = 0
export(int) var seconds: int = 0
var mseconds: int = 0

onready var timer: Timer = $Timer
onready var minsLabel: Label = $HBoxContainer/Minutes
onready var secsLabel: Label = $HBoxContainer/Seconds

func _ready():
	minutes = 1
	seconds = 10
	_showTimer(minutes, seconds)

func _on_Timer_timeout():
	seconds -= 1
	_updateTimer()

func _updateTimer():
	if minutes > 0 and seconds <= 0:
		minutes -= 1
		seconds = 60
	_showTimer(minutes, seconds)
	

func _showTimer(mins: int, secs: int):
	if mins <= 9:
		minsLabel.set_text("0" + str(mins))
	else:
		minsLabel.set_text(str(mins))

	if secs <= 9:
		secsLabel.set_text("0" + str(secs))
	else:
		secsLabel.set_text(str(secs))
	
