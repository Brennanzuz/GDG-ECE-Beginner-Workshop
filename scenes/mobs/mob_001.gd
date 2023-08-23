extends CharacterBody2D

@export var damage = 20.0
@export var health = 100.0

func receive_damage(damage):
	health -= damage
	if health <= 0:
		die()

func die():
	queue_free()

func _on_hurtbox_area_entered(area: Area2D):
	receive_damage(area.damage)
