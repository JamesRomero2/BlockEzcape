extends Area2D

signal levelScene

export(PackedScene) var target_level
var playerAboveLevel: bool = false

func _on_LevelEntry_body_entered(body: Node):
	if body.name == "Player":
		playerAboveLevel = true
		if !playerAboveLevel: return
		emit_signal("levelScene", target_level, playerAboveLevel)

func _on_LevelEntry_body_exited(body: Node):
	if body.name == "Player":
		playerAboveLevel = false
		emit_signal("levelScene", target_level, playerAboveLevel)
