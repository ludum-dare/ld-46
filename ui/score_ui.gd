extends Control

signal start_game

var score = 0

func set_health(val):
	$healthbar.value = min(max(val, 0), 100)

func _process(delta):
	$score.text = str(score)
	if Input.is_action_pressed("start"):
		$start.visible = false
		emit_signal("start_game")

func _ready():
	pass # Replace with function body.

