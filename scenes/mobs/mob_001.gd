extends CharacterBody2D

@export var damage = 20.0
@export var health = 100.0
var direction
const SPEED = 100.0
const FRICTION = 1

func _physics_process(delta):
	if $NavigationAgent2D.is_navigation_finished():
		return
		
	direction = global_position.direction_to($NavigationAgent2D.get_next_path_position())
	velocity = velocity.lerp(direction * SPEED, FRICTION)
	
	move_and_slide()


func receive_damage(damage):
	health -= damage
	if health <= 0:
		die()

func die():
	queue_free()

func _on_hurtbox_area_entered(area: Area2D):
	receive_damage(area.damage)
	area.queue_free()

func _on_timer_timeout():
	if get_parent().get_node("Player"):
		$NavigationAgent2D.target_position = get_parent().get_node("Player").global_position
