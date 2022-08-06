extends Area2D

signal KeyCollected

func _on_Key_body_entered(body:Node):
	if body.name == "Player":
		emit_signal("KeyCollected")
		queue_free()
