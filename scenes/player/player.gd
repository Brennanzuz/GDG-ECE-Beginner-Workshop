extends CharacterBody2D

const SPEED = 300.0
@export var health = 100.0
var can_damage = true
var GameOverScreen = preload("res://scenes/user_interface/game_over_screen.tscn")
var Missile = preload("res://scenes/projectiles/missile.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("shoot_missile"):
		shoot_missile()

func _physics_process(delta):
#	if Input.is_action_pressed("ui_up"):
#		velocity = Vector2.UP
#	if Input.is_action_pressed("ui_down"):
#		velocity = Vector2.DOWN
#	if Input.is_action_pressed("ui_left"):
#		velocity = Vector2.LEFT
#	if Input.is_action_pressed("ui_right"):
#		velocity = Vector2.RIGHT

# Method 2
#	var input_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
#	var input_y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
#	velocity.x = input_x * SPEED
#	velocity.y = input_y * SPEED
#	velocity.normalized()

# Method 3
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down")).normalized()
	velocity = direction * SPEED
	
	move_and_slide()

func receive_damage(damage):
	if can_damage:
		can_damage = false
		$InvulnerabilityTimer.start()
		health -= damage
		if health <= 0:
			die()

func die():
	var game_over_screen = GameOverScreen.instantiate()
	get_parent().add_child(game_over_screen)
	queue_free()
	
func shoot_missile():
	var missile = Missile.instantiate()
	get_parent().add_child(missile)
	missile.global_position = global_position
	missile.look_at(get_global_mouse_position())

func _on_hurtbox_area_entered(area : Area2D):
	receive_damage(area.get_parent().damage)


func _on_invulnerability_timer_timeout():
	can_damage = true
