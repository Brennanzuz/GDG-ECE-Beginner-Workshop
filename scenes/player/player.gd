extends CharacterBody2D

const SPEED = 300.0

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

