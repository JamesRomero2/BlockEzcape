extends Area2D

signal levelScene

export(PackedScene) var target_level

func _on_LevelEntry_body_entered(body):
	if body.name == "Player" and get_overlapping_bodies().size() > 0:
		emit_signal("levelScene", target_level)
