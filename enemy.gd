extends Area2D

var direction: Vector2 = Vector2.ZERO
@export var speed: int = 15
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	var animation_names = sprite.sprite_frames.get_animation_names()
	sprite.play(animation_names[randi() % animation_names.size()])

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _process(delta):
	global_position += direction * speed * delta * 60
	
