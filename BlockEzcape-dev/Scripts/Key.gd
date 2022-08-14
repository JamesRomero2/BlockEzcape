extends Area2D

signal KeyCollected

var collected := false

func _on_Key_body_entered(body:Node):
	if body.name == "Player" and !collected:
		emit_signal("KeyCollected")
		$AnimationPlayer.play("Collected")
		
