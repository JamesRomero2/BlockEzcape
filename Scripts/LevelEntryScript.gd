extends Area2D

signal levelScene

export(PackedScene) var target_level
var playerAboveLevel : bool = false

func _on_LevelEntry_body_entered(body):
	if body.name == "Player" and get_overlapping_bodies().size() > 0:
		playerAboveLevel = true
		if !playerAboveLevel: return
		print("In")
		emit_signal("levelScene", target_level, playerAboveLevel)

func _on_LevelEntry_body_exited(body):
	if body.name == "Player":
		print("Out")
		playerAboveLevel = false
		emit_signal("levelScene", target_level, playerAboveLevel)
