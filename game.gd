extends Node2D

var enemy: PackedScene = preload("res://enemy.tscn")

func _on_timer_timeout():
	var enemy_scene = enemy.instantiate()
	
	var spawn_location = $Path2D/PathFollow2D
	spawn_location.progress_ratio = randf()
	enemy_scene.global_position = spawn_location.global_position
	
	var enemy_rotation = spawn_location.rotation + deg_to_rad(90) + deg_to_rad(randi_range(-45,45))
	enemy_scene.direction = Vector2(1,0).rotated(enemy_rotation)
	
	add_child(enemy_scene)
	
	enemy_scene.sprite.rotation = enemy_rotation
