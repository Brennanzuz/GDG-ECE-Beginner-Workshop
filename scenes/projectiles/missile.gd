extends Area2D

@export var damage = 50.0
const SPEED = 300.0

func _on_lifetime_timeout():
	queue_free()

func _physics_process(delta):
	global_position += Vector2.RIGHT.rotated(rotation) * SPEED * delta
