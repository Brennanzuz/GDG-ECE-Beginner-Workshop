extends Area2D

@export var damage = 50.0

func _on_lifetime_timeout():
	queue_free()
