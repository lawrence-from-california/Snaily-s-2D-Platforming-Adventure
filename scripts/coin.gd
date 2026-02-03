extends Area2D

#collision
func _on_body_entered(_body: Node2D) -> void:
	print("Coin+1")
	queue_free()
