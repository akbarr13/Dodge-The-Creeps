extends Area2D

@export var speed: int= 15

var direction:Vector2 = Vector2.ZERO


func _process(delta):
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		
	global_position += direction * speed * delta * 60
	
	if direction.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	if direction.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif direction.x < 0:
		$AnimatedSprite2D.flip_h = true
	if direction.y > 0:
		$AnimatedSprite2D.flip_v = true
	elif direction.y < 0:
		$AnimatedSprite2D.flip_v = false
	
	if direction.x != 0:
		$AnimatedSprite2D.animation = "walk"
	elif direction.y != 0:
		$AnimatedSprite2D.animation = "up"


func _on_area_entered(enemy):
	get_parent().get_node("BackgroundMusic").stop()
	$"../DeathSound".play()
	$"../Label".visible = false
	$"../Timer".stop()
	queue_free()
