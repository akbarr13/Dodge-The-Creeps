extends Label

@onready var score : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_score_timer_timeout():
	score += 1
	text = str(score)
	pass # Replace with function body.
